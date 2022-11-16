import 'package:flutter/material.dart';

import '../../services/hive_manager.dart';

class OfferCreationViewModel extends ChangeNotifier {
  var confirmed = false;

  // BOLT12
  var quantityMin = 1;
  var description = '';
  var limitDescription = 'No limits set.';
  var currency = 'msat';
  var generatedDescription = '';

  num? amount;
  int? quantityMax;

  void initialise(BuildContext context) {
    generateDescription();
  }

  void generateDescription() {
    if (amount != null) {
      generatedDescription = '$amount';
    }
    if (currency != null) {
      generatedDescription = '$generatedDescription $currency';
    }
    if (limitDescription != 'No limits set.') {
      generatedDescription =
          '$generatedDescription, $limitDescription'.toLowerCase();
    } else {
      generatedDescription = 'Generic offer.';
    }
    notifyListeners();
  }

  Future<void> navigateAndDisplayAmount(BuildContext context) async {
    print('Changing some values.');
    amount = 1000;
    currency = 'sats';

    quantityMax = 50;
    if (quantityMax != null) {
      limitDescription = 'Up to $quantityMax times.';
    } else {
      limitDescription = 'No limits set.';
    }

    if (description.isEmpty) {
      generateDescription();
    }

    confirmed = validatingInputs();
    notifyListeners();
  }

  // Validation of BOLT12 spec.
  bool validatingInputs() {
    confirmed = true;
    if (amount != null) {
      assert(amount! > 0);
    } else {
      confirmed = false;
    }
    return confirmed;
  }

  Future<void> saveOffer(BuildContext context) async {
    print('Offer is being saved');

    if (description.isEmpty) {
      description = generatedDescription;
    }

    final hiveManager = HiveManager();
    hiveManager.addToBox(
      currency: currency,
      description: description,
      amount: amount.toString(),
      quantityMin: quantityMin.toString(),
      quantityMax: quantityMax.toString(),
    );

    Navigator.pop(context);
  }
}
