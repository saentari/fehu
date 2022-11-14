import 'package:flutter/material.dart';

class SafeAreaX extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget? appBar;
  final Widget? bottomBar;
  const SafeAreaX({
    Key? key,
    this.appBar,
    this.bottomBar,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        body: child,
        bottomNavigationBar: bottomBar,
      ),
    );
  }
}
