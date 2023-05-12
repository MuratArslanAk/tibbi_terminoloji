import 'package:get/get.dart';
import 'package:tibbi_terminoloji/controller/history_controller.dart';
import 'package:tibbi_terminoloji/model/dictionary_model.dart';
import 'package:tibbi_terminoloji/model/read_model.dart';
import 'package:tibbi_terminoloji/services/api.dart';

class ReadController extends GetxController {
  // ignore: deprecated_member_use
  HistoryController favController = Get.find();
  var words = List<Words>.empty(growable: true).obs;
  var dictionary = List<Dictionary>.empty(growable: true).obs;

  var searchItem = List<Words>.empty(growable: true).obs;
  var textSearched = "".obs;
  @override
  void onInit() {
    getRead();
    super.onInit();
  }

  void getRead() async {
    try {
      var notifications = await API.getFile();

      if (notifications != null) {
        words.value = notifications.words;

        for (var i = 0; i < words.length; i++) {
          bool isFavorite = false;
          for (var j = 0; j < favController.notes.length; j++) {
            if (words[i].terim == favController.notes[j].terim) {
              isFavorite = true;
              // break;
            }
          }
          Dictionary d = Dictionary(id: i, word: words[i]);
          d.isFavorite.value = isFavorite;
          dictionary.insert(i, d);
        }
      }
    } finally {
      //TODO
    }
  }

  bool isFavorite(String terim) {
    for (var i = 0; i < favController.notes.length; i++) {
      if (terim == favController.notes[i].terim) {
        return true;
      }
    }
    return false;
  }
}
