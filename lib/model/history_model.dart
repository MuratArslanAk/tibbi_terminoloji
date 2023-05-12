import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:tibbi_terminoloji/controller/history_controller.dart';
import 'package:tibbi_terminoloji/hive/history_box.dart';

part 'history_model.g.dart';

@HiveType(typeId: 0)
// ignore: camel_case_types
class history_model extends HiveObject {
  @HiveField(0)
  late String terim;
  @HiveField(1)
  late String turkishMeaning;
  @HiveField(2)
  late String english;

  history_model({
    required this.terim,
    required this.turkishMeaning,
    required this.english,
  });

  add() {
    final HistoryController noteController = Get.find();
    List notes = noteController.notes;

    bool isThere = false;
    for (var i = 0; i < notes.length; i++) {
      if (notes[i].terim == terim) {
        isThere = true;
        break;
      }
    }
    if (!isThere) {
      notes.add(this);
      HistoryBox().putNotes(notes);
    }
  }

  @override
  delete() async {
    final HistoryController noteController = Get.put(HistoryController());
    List notes = noteController.notes;
    for (var i = 0; i < notes.length; i++) {
      if (notes[i].terim == terim) {
        notes.remove(notes[i]);
        HistoryBox().putNotes(notes);
      }
    }
    notes.remove(this);
    HistoryBox().putNotes(notes);
  }
}
