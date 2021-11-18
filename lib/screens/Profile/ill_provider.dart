import 'model_person.dart';
import 'package:flutter/cupertino.dart';

class IllProviders extends ChangeNotifier {
  //Notes List
  List<IllModel> userIll = [
    IllModel("Huyết áp", "Mức nhẹ"),
    IllModel("Béo phì", "Mức nhẹ")
  ];
  List<IllModel> get getIll {
    return userIll;
  }

// function to add data to list of notes
  void addIll(String ill, String level) {
    IllModel newIll = new IllModel(ill, level);
    userIll.add(newIll);
    notifyListeners();
  }

  void editIll(IllModel newIll, int index) {
    userIll[index] = newIll;
  }

  // function to remove or delete notes by using list index position
  void removeIll(int index) {
    userIll.removeAt(index);
    notifyListeners();
  }
}
