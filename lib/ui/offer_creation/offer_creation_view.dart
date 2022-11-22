import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/safe_area.dart';
import '../custom_icons.dart';
import '../theme.dart';
import 'offer_creation_view_model.dart';

class OfferCreationView extends StatelessWidget {
  const OfferCreationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OfferCreationViewModel>.reactive(
      viewModelBuilder: () => OfferCreationViewModel(),
      onModelReady: (viewModel) => viewModel.initialise(context),
      builder: (context, model, child) => SafeAreaX(
        appBar: AppBar(
          centerTitle: true,
          title: titleIcon,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
        ),
        bottomBar: Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Row(
            children: [
              Expanded(
                child: model.confirmed == true
                    ? TextButton(
                        onPressed: () => model.confirmed == true
                            ? model.saveOffer(context)
                            : null,
                        style: TextButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16.0),
                            ),
                          ),
                        ),
                        child: const Text('Create'),
                      )
                    : TextButton(
                        onPressed: null,
                        style: TextButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16.0),
                            ),
                          ),
                        ),
                        child: const Text('Create'),
                      ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: secondaryButtonStyle,
                  child: const Text('Cancel'),
                ),
              ),
            ],
          ),
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => model.navigateAndDisplayAmount(context),
              child: Container(
                // Mandatory width and color for clickable area.
                width: double.infinity,
                color: customTransparent,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Price',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: customDarkNeutral5,
                      ),
                    ),
                    Text(
                      model.amount > 0
                          ? '${model.amount} ${model.currency}'
                          : 'Any amount',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => model.dummyData(context),
              child: Container(
                width: double.infinity,
                color: customTransparent,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Limit',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: customDarkNeutral5,
                      ),
                    ),
                    Text(
                      model.limitDescription,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => model.dummyData(context),
              child: Container(
                width: double.infinity,
                color: customTransparent,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: customDarkNeutral5,
                      ),
                    ),
                    Text(
                      model.description.isNotEmpty
                          ? model.description
                          : model.generatedDescription,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
