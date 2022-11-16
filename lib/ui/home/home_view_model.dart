import 'package:flutter/cupertino.dart';

import '../../services/hive_manager.dart';

class HomeViewModel extends ChangeNotifier {
  final hiveManager = HiveManager();

  late PageController pageController;

  void initialise(BuildContext context) {
    var initialPage = ModalRoute.of(context)!.settings.arguments ?? 0;
    pageController = PageController(initialPage: initialPage as int);
    notifyListeners();
  }
}
