import 'package:flutter/cupertino.dart';

class Favorite extends ChangeNotifier{

  bool _isFavorite = false;

  get isFavorite => _isFavorite;

  handleFavorite(){
    print(_isFavorite);
    _isFavorite = !_isFavorite;
    notifyListeners();
  }
}