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

  static const routeName = '/home_screen';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (viewModel) => viewModel.initialise(context),
        builder: (context, model, child) {
          return SafeAreaX(
            appBar: AppBar(
              centerTitle: true,
              title: GestureDetector(
                  onTap: () =>
                      model.deleteOffer(model.currentPageNotifier.value),
                  child: titleIcon),
              backgroundColor: customBlack,
              automaticallyImplyLeading: false,
              actions: model.showActions(context),
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
                      print(index);
                      model.currentPageNotifier.value = index;
                      model.updateOffer(index);
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
          );
        });
  }
}
