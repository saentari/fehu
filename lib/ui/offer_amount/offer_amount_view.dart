import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/safe_area.dart';
import '../custom_icons.dart';
import '../theme.dart';
import 'offer_amount_view_model.dart';

class OfferAmountView extends StatelessWidget {
  const OfferAmountView(this.amount, this.currency, {Key? key})
      : super(key: key);

  final int amount;
  final String currency;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OfferAmountViewModel>.reactive(
      viewModelBuilder: () => OfferAmountViewModel(),
      onModelReady: (viewModel) =>
          viewModel.initialise(context, amount, currency),
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
                            ? Navigator.pop(
                                context, [model.amount, model.currency])
                            : null,
                        style: TextButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16.0),
                            ),
                          ),
                        ),
                        child: const Text('Confirm'),
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
                        child: const Text('Confirm'),
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
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    'Amount',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    style: const TextStyle(fontSize: 40.0),
                    controller: model.amountTextController,
                    textAlign: TextAlign.center,
                    minLines: 1,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration.collapsed(hintText: ''),
                  ),
                  const SizedBox(height: 40.0),
                  const Text(
                    'Unit',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    style: const TextStyle(fontSize: 40.0),
                    controller: model.unitTextController,
                    textAlign: TextAlign.center,
                    minLines: 1,
                    keyboardType: TextInputType.text,
                    decoration:
                        const InputDecoration.collapsed(hintText: 'sats'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
