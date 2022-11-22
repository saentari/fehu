import 'package:flutter/cupertino.dart';

import '../home/home_view.dart';

class LoadingViewModel extends ChangeNotifier {
  void initialise(BuildContext context) {
    // Show a placeholder when data is being retrieved.
    Future<void>.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => const HomeView(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
      );
    });
  }
}
