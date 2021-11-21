import '../../models/model_person.dart';
import 'package:flutter/cupertino.dart';

class IllProviders extends ChangeNotifier {
  //Notes List
  List<IllModel> userIll = [
    IllModel("Huyết áp", "Mức nhẹ", "KLK"),
    IllModel("Béo phì", "Mức nhẹ", "KJJJ"),
  ];
  List<IllModel> get getIll {
    return userIll;
  }

  setIll(List<IllModel> updated) {
    userIll = updated;
    notifyListeners();
  }

// function to add data to list of notes
  void addIll(String ill, String level) {
    IllModel newIll = new IllModel(ill, level, "HDHDH");
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
