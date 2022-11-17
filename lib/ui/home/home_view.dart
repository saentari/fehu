import 'package:flutter/material.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/offer_card.dart';
import '../../widgets/offer_card_new.dart';
import '../../widgets/safe_area.dart';
import '../custom_icons.dart';
import '../theme.dart';
import 'home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (viewModel) => viewModel.initialise(context),
      builder: (context, model, child) => SafeAreaX(
        appBar: AppBar(
          centerTitle: true,
          title: GestureDetector(
              onTap: () {
                int lastItem = model.hiveManager.getBoxLength() - 1;
                print(lastItem);
                model.hiveManager.deleteFromBox(lastItem);
              },
              child: titleIcon),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: model.hiveManager.getBoxLength() + 1,
                controller: model.pageController,
                itemBuilder: (BuildContext context, int index) {
                  if (index == model.hiveManager.getBoxLength()) {
                    return const OfferCardNew();
                  } else {
                    final offer = model.hiveManager.getFromBox(index);
                    return OfferCard(offer);
                  }
                },
                onPageChanged: (int index) {
                  model.currentPageNotifier.value = index;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: model.hiveManager.getBoxLength() > 0
                  ? Center(
                      child: CirclePageIndicator(
                        size: 8.0,
                        selectedSize: 8.0,
                        dotColor: customWhite,
                        selectedDotColor: customYellow,
                        itemCount: model.hiveManager.getBoxLength() + 1,
                        currentPageNotifier: model.currentPageNotifier,
                      ),
                    )
                  : const SizedBox(height: 8.0),
            ),
          ],
        ),
      ),
    );
  }
}
