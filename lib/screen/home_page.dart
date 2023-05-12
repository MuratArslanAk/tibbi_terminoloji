import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tibbi_terminoloji/controller/fav_controller.dart';
import 'package:tibbi_terminoloji/controller/read_controller.dart';
import 'package:tibbi_terminoloji/controller/history_controller.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../data/admob_service.dart';

import 'package:tibbi_terminoloji/model/history_model.dart';
import 'package:tibbi_terminoloji/screen/details.dart';
import 'package:tibbi_terminoloji/screen/searchbar.dart' as custom_search;

//import 'package:tibbi_terminoloji/screen/searchbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomeState();
}

HistoryController hiController = Get.find();

ReadController textController = Get.find();
FavController noteController = Get.put(FavController());

//====================*********

class _HomeState extends State<HomePage> {
  BannerAd? _banner;
  //InterstitialAd? _interstitialAd;

  @override
  void initState() {
    super.initState();
    _createBannerAd();
    //_createInterstitialAd();
  }

  void _createBannerAd() {
    _banner = BannerAd(
      size: AdSize.banner,
      adUnitId: Admobservice.bannerAdUnitId!,
      listener: Admobservice.bannerAdListener,
      request: const AdRequest(),
    )..load();
  }
/*
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
  */
//=====================

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            // brightness: Brightness.dark,
            systemOverlayStyle:
                SystemUiOverlayStyle.dark, // status bar brightness
          ),
          body: Container(
              color: const Color(0xFFCD0916),
              child: Column(
                children: [
                  Container(
                      color: const Color(0xFFCD0916),
                      child: custom_search.SearchBar(textController.words)),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Obx(() {
                        return ListView.builder(
                            itemCount: (textController.searchItem.isNotEmpty)
                                ? textController.searchItem.length
                                : textController.words.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return (textController.searchItem.isNotEmpty)
                                  ? Card(
                                      color: Colors.white,
                                      child: InkWell(
                                        onTap: () async {
                                          // _showInterstitialAd();
                                          await Get.to(() => Details(
                                              textController
                                                  .searchItem[index]));
                                        },
                                        child: ListTile(
                                          tileColor: Colors.white,
                                          leading: const CircleAvatar(
                                            backgroundColor: Colors.white,
                                            //child: const Icon(Icons
                                            //  .mic), //Text("${index+1}"),
                                          ),
                                          title: Text(
                                            textController
                                                .searchItem[index].terim,
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  textController
                                                      .searchItem[index]
                                                      .turkishMeaning,
                                                  style: const TextStyle(
                                                      color: Colors.black)),
                                              Text(
                                                  textController
                                                      .searchItem[index]
                                                      .english,
                                                  style: const TextStyle(
                                                      color: Colors.black87)),
                                            ],
                                          ),
                                          trailing: Obx(() => IconButton(
                                                onPressed: () {
                                                  history_model note =
                                                      history_model(
                                                    terim: textController
                                                        .searchItem[index]
                                                        .terim,
                                                    turkishMeaning:
                                                        textController
                                                            .searchItem[index]
                                                            .turkishMeaning,
                                                    english: textController
                                                        .searchItem[index]
                                                        .english,
                                                  );

                                                  if (textController.isFavorite(
                                                          textController
                                                              .searchItem[index]
                                                              .terim) ==
                                                      false) {
                                                    note.add();
                                                    textController
                                                        .dictionary[
                                                            textController
                                                                .dictionary[
                                                                    index]
                                                                .id]
                                                        .isFavorite
                                                        .value = true;
                                                  } else {
                                                    note.delete();

                                                    textController
                                                        .dictionary[
                                                            textController
                                                                .dictionary[
                                                                    index]
                                                                .id]
                                                        .isFavorite
                                                        .value = false;
                                                  }
                                                },
                                                icon: Icon(
                                                  (textController
                                                              .dictionary[
                                                                  textController
                                                                      .dictionary[
                                                                          index]
                                                                      .id]
                                                              .isFavorite
                                                              .value ==
                                                          false)
                                                      ? Icons
                                                          .favorite_border_rounded
                                                      : Icons.favorite,
                                                  color: (textController
                                                              .dictionary[
                                                                  textController
                                                                      .dictionary[
                                                                          index]
                                                                      .id]
                                                              .isFavorite
                                                              .value ==
                                                          false)
                                                      ? Colors.grey
                                                      : const Color(0xFFCD0916),
                                                ),
                                              )),
                                        ),
                                      ),
                                    )
                                  : Card(
                                      margin: const EdgeInsets.only(
                                          top: 10, left: 8, right: 8),
                                      color: Colors.white,
                                      child: InkWell(
                                        onTap: () async {
                                          // _showInterstitialAd();
                                          await Get.to(() => Details(
                                              textController.words[index]));
                                        },
                                        child: ListTile(
                                          tileColor: Colors.white,
                                          leading: const CircleAvatar(
                                            backgroundColor: Colors.white,
                                            //Text("${index+1}"),
                                          ),
                                          title: Text(
                                            textController.words[index].terim,
                                            style: const TextStyle(
                                                fontFamily: 'CourierPrime',
                                                color: Colors.black87),
                                          ),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  textController.words[index]
                                                      .turkishMeaning,
                                                  style: const TextStyle(
                                                      fontFamily:
                                                          'CourierPrime',
                                                      color: Colors.black)),
                                              //Text(
                                              //  textController
                                              //    .words[index].english,
                                              //style: TextStyle(
                                              //  color: Colors
                                              //    .redAccent[700])),
                                              const Text("")
                                              // style: TextStyle(
                                              // color: Colors.)),
                                            ],
                                          ),
                                          trailing: Obx(() => IconButton(
                                                onPressed: () {
                                                  history_model note =
                                                      history_model(
                                                    terim: textController
                                                        .words[index].terim,
                                                    turkishMeaning:
                                                        textController
                                                            .words[index]
                                                            .turkishMeaning,
                                                    english: textController
                                                        .words[index].english,
                                                  );
                                                  if (textController
                                                          .dictionary[
                                                              textController
                                                                  .dictionary[
                                                                      index]
                                                                  .id]
                                                          .isFavorite
                                                          .value ==
                                                      false) {
                                                    note.add();
                                                    textController
                                                        .dictionary[
                                                            textController
                                                                .dictionary[
                                                                    index]
                                                                .id]
                                                        .isFavorite
                                                        .value = true;
                                                  } else {
                                                    note.delete();

                                                    textController
                                                        .dictionary[
                                                            textController
                                                                .dictionary[
                                                                    index]
                                                                .id]
                                                        .isFavorite
                                                        .value = false;
                                                  }
                                                },
                                                icon: Icon(
                                                  (textController
                                                              .dictionary[
                                                                  textController
                                                                      .dictionary[
                                                                          index]
                                                                      .id]
                                                              .isFavorite
                                                              .value ==
                                                          false)
                                                      ? Icons
                                                          .favorite_border_rounded
                                                      : Icons.favorite,
                                                  color: (textController
                                                              .dictionary[
                                                                  textController
                                                                      .dictionary[
                                                                          index]
                                                                      .id]
                                                              .isFavorite
                                                              .value ==
                                                          false)
                                                      ? Colors.grey
                                                      : const Color(0xFFCD0916),
                                                ),
                                              )),
                                        ),
                                      ),
                                    );
                            });
                      }),
                    ),
                  ),
                ],
              )),
          bottomNavigationBar: _banner == null
              ? Container()
              : Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  height: 52,
                  child: AdWidget(ad: _banner!),
                )),
    );
  }
}
