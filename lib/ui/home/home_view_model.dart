import 'package:flutter/cupertino.dart';

class HomeViewModel extends ChangeNotifier {
  PageController? pageController;

  void initialise(BuildContext context) {
    var initialPage = ModalRoute.of(context)!.settings.arguments ?? 0;
    pageController = PageController(initialPage: initialPage as int);
    notifyListeners();
  }
}
