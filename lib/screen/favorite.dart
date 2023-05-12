import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tibbi_terminoloji/controller/history_controller.dart';
import 'package:tibbi_terminoloji/controller/read_controller.dart';
import 'package:tibbi_terminoloji/hive/history_box.dart';
import 'package:tibbi_terminoloji/model/history_model.dart';
import 'package:tibbi_terminoloji/screen/details.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../data/admob_service.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NotesListScreenState createState() => _NotesListScreenState();
}

class _NotesListScreenState extends State<Favorite> {
  ReadController textController = Get.find();
  HistoryController test = Get.find();
  getNotes() async {
    final HistoryController noteControllerP = Get.find();
    await noteControllerP.setNotes(HistoryBox().getNotes());
  }

  @override
  void initState() {
    getNotes();
    super.initState();
    _createBannerAd();
    _createInterstitialAd();
  }

  //====================*********
  BannerAd? _banner;
  InterstitialAd? _interstitialAd;

  void _createBannerAd() {
    _banner = BannerAd(
      size: AdSize.banner,
      adUnitId: Admobservice.bannerAdUnitId!,
      listener: Admobservice.bannerAdListener,
      request: const AdRequest(),
    )..load();
  }

  void _createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: Admobservice.interstitialAdUnitId!,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) => _interstitialAd = ad,
          onAdFailedToLoad: (LoadAdError error) => _interstitialAd = null),
    );
  }

  void _showInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _createInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          _createInterstitialAd();
        },
      );
      _interstitialAd!.show();
      _interstitialAd = null;
    }
  }
//=====================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFCD0916),
          title: const Text("Favorites"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: GetBuilder(
                builder: (HistoryController noteController) {
                  return noteController.notes.isEmpty
                      ? const Center(
                          child: Text("No favorite words found !"),
                        )
                      : ListView.builder(
                          itemCount: noteController.notes.length,
                          itemBuilder: (context, index) {
                            return Card(
                              margin: const EdgeInsets.only(
                                  top: 10, left: 8, right: 8),
                              color: Colors.white,
                              child: InkWell(
                                onTap: () async {
                                  _showInterstitialAd();
                                  await Get.to(() =>
                                      Details(textController.words[index]));
                                },
                                child: ListTile(
                                  tileColor: Colors.white,
                                  leading: const CircleAvatar(
                                    backgroundColor: Colors.white,
                                    // child: Icon(Icons.mic), //Text("${index+1}"),
                                  ),
                                  title: Text(
                                    noteController.notes[index].terim,
                                    style: const TextStyle(
                                        fontFamily: 'CourierPrime',
                                        color: Colors.black87),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          noteController
                                              .notes[index].turkishMeaning,
                                          style: const TextStyle(
                                              fontFamily: 'CourierPrime',
                                              color: Colors.black87)),
                                      Text(noteController.notes[index].english,
                                          style: const TextStyle(
                                              fontFamily: 'CourierPrime',
                                              color: Colors.black87)),
                                      const Text("")
                                    ],
                                  ),
                                  trailing: IconButton(
                                    onPressed: () {
                                      history_model note = history_model(
                                        terim:
                                            noteController.notes[index].terim,
                                        turkishMeaning: noteController
                                            .notes[index].turkishMeaning,
                                        english:
                                            noteController.notes[index].english,
                                      );

                                      for (var i = 0;
                                          i < textController.dictionary.length;
                                          i++) {
                                        if (textController
                                                .dictionary[i].word.terim ==
                                            noteController.notes[index].terim) {
                                          textController.dictionary[i]
                                              .isFavorite.value = false;
                                          break;
                                        }
                                      }
                                      note.delete();

                                      if (kDebugMode) {
                                        print(
                                            'Is Favorite : $noteController.isFavorite.value');
                                      }
                                    },
                                    icon: Icon(
                                      Icons.favorite,
                                      color: (textController.isFavorite(
                                                  noteController
                                                      .notes[index].terim) ==
                                              false)
                                          ? Colors.grey
                                          : const Color(0xFFCD0916),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          });
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: _banner == null
            ? Container()
            : Container(
                margin: const EdgeInsets.only(bottom: 12),
                height: 52,
                child: AdWidget(ad: _banner!),
              ));
  }
}
