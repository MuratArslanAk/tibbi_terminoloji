import 'package:get/get.dart';

class ReadModel {
  late List<Words> words;

  ReadModel({required this.words});

  ReadModel.fromJson(Map<String, dynamic> json) {
    if (json['words'] != null) {
      words = <Words>[];
      json['words'].forEach((v) {
        words.add(Words.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['words'] = words.map((v) => v.toJson()).toList();
    return data;
  }
}

class Words {
  late String terim;
  late String turkishMeaning;
  late String english;
  late RxBool isFavorite;
  //late Example example;

  Words({
    required this.terim,
    required this.turkishMeaning,
    required this.english,
    required isFavorite,
    //required this.example
  });

  Words.fromJson(Map<String, dynamic> json) {
    terim = json['terim'];
    turkishMeaning = json['turkishMeaning'];
    english = json['english'];
    //english = json['english'];

    //example = (json['example'] != null
    //? new Example.fromJson(json['example'])
    // : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['terim'] = terim;
    data['turkishMeaning'] = turkishMeaning;
    data['english'] = english;
    //if (this.example != null) {
    //   data['example'] = this.example.toJson();
    // }
    return data;
  }
}
/*
class Example {
  late List<String> examTerim;
  late List<String> examTurkish;
  late List<String> examEnglish;

  Example(
      {required this.examTerim,
      required this.examTurkish,
      required this.examEnglish});

  Example.fromJson(Map<String, dynamic> json) {
    examTerim = json['examTerim'].cast<String>();
    examTurkish = json['examTurkish'].cast<String>();
    examEnglish = json['examEnglish'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['examTerim'] = this.examTerim;
    data['examTurkish'] = this.examTurkish;
    data['examEnglish'] = this.examEnglish;
    return data;
  }
}
*/
