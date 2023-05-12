import 'package:get/get.dart';

class FavController extends GetxController {
  List _notes = [];
  bool _isFavorite = false;
  List get notes => _notes;
  isFavorite(var isFavorite) {
    _isFavorite = isFavorite;
    update();
  }

  bool getFavorite() {
    return _isFavorite;
  }

  setNotes(List data) {
    _notes = data;
    update();
  }
}
