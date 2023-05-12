// import 'package:beymart/yem/controller/favController.dart';
// import 'package:get/get.dart';
// import 'package:hive/hive.dart';

// class FavBox{

//   getNotes(){
//     return Hive.box("favBox").get("fav", defaultValue: []);
//   }

//   putNotes(List data) async {
//     final FavController noteController = Get.find();
//     await Hive.box("favBox").put("fav", data);
//     List notes = getNotes();
//     noteController.setNotes(notes);
//   }

// }
