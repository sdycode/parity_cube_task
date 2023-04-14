import 'package:flutter/foundation.dart';

class DataProvider with ChangeNotifier {
  updateUI() {
    notifyListeners();
  }
}
