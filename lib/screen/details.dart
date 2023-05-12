import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tibbi_terminoloji/model/read_model.dart';

// ignore: must_be_immutable
class Details extends StatelessWidget {
  late Words words;

  Details(this.words, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFCD0916),
        title: Text(words.terim),
        actions: [
          FavoriteButton(
            isFavorite: false,
            iconDisabledColor: Colors.white70,
            iconColor: Colors.redAccent,
            iconSize: 50,
            valueChanged: (isFavorite) {},
          ),
        ],
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: Get.size.width,
                          //color: Colors.white,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Terim",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'CourierPrime',
                                    color: Colors.black)),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(words.terim,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.normal)),
                      ),
                      /*
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Example : "),
                      ),
                      ListView.builder(
                          itemCount: words.example.examTerim.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(words.example.examTerim[index],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'CourierPrime',
                                      fontWeight: FontWeight.bold,
                                    )),
                              )),
                              */
                    ],
                  )),
              const Divider(),
              Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: Get.size.width,
                          //color: const Color(0xFFCD0916),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Turkish Meaning",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'CourierPrime',
                                    color: Colors.black)),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(words.turkishMeaning,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.normal)),
                      ),
                      /*
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Örnek : "),
                      ),
                      ListView.builder(
                          // physics: NeverScrollableScrollPhysics(),
                          itemCount: words.example.examTurkish.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(words.example.examTurkish[index],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                              )),
                              */
                    ],
                  )),
              /*
              Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: Get.size.width,
                          color: const Color(0xFFCD0916),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("English",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'CourierPrime',
                                    color: Colors.white)),
                          )),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(words.english,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Example : "),
                      ),
                      ListView.builder(
                          // physics: NeverScrollableScrollPhysics(),
                          itemCount: words.example.examEnglish.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(words.example.examEnglish[index],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                              )),
                    ],
                  )),
                  */
            ],
          )),
    );
  }
}
