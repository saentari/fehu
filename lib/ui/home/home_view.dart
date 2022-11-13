import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (viewModel) => viewModel.initialise(context),
      builder: (context, model, child) => const SafeArea(
        child: Scaffold(
          body: Center(
            child: Text('some widget'),
          ),
        ),
      ),
    );
  }
}
