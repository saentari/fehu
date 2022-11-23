import 'package:flutter/material.dart';

import '../../models/offer.dart';
import '../../services/hive_manager.dart';
import '../qr/qr_view.dart';

class HomeViewModel extends ChangeNotifier {
  final hiveManager = HiveManager();
  final currentPageNotifier = ValueNotifier<int>(0);

  late PageController pageController;
  Offer? offer;

  void initialise(BuildContext context) {
    var initialPage = ModalRoute.of(context)!.settings.arguments ?? 0;
    pageController = PageController(initialPage: initialPage as int);
    currentPageNotifier.value = initialPage;
    updateOffer(initialPage);
    notifyListeners();
  }

  void updateOffer(int index) {
    if (index >= hiveManager.getBoxLength()) {
      offer = null;
    } else {
      offer = hiveManager.getFromBox(index);
    }
    notifyListeners();
  }

  void deleteOffer(int index) {
    if (index < hiveManager.getBoxLength()) {
      hiveManager.deleteFromBox(index);
      notifyListeners();
    }
  }

  List<Widget> showActions(BuildContext context) {
    if (offer != null) {
      return [
        IconButton(
          icon: const Icon(Icons.qr_code),
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => QrView(offer!),
            ),
          ),
        ),
      ];
    } else {
      return [
        IconButton(
          icon: const Icon(Icons.qr_code_scanner),
          onPressed: () => print('scan'),
        )
      ];
    }
  }
}
