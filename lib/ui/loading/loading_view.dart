import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../custom_icons.dart';
import 'loading_view_model.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoadingViewModel>.nonReactive(
      viewModelBuilder: () => LoadingViewModel(),
      onModelReady: (viewModel) => viewModel.initialise(context),
      builder: (context, model, child) => Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SafeArea(
          child: Scaffold(
            body: ClipRRect(
              borderRadius: BorderRadius.circular(24.0),
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "assets/images/joanna-kosinska-4dnG4q3kxdg-unsplash.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(top: 300.0, child: logoTextIcon),
                    const Positioned(
                      bottom: 24.0,
                      child: Text(
                        'Your offers, your bitcoin.\n100% open-source & open-design',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
