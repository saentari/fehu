import 'package:flutter/material.dart';

class OfferCreationViewModel extends ChangeNotifier {
  var confirmed = false;

  // BOLT12
  var quantityMin = 1;
  var description = '';
  var limitDescription = 'No limits set.';

  num? amount;
  int? quantityMax;

  String? unit;

  late String generatedDescription;

  void initialise(BuildContext context) {
    generateDescription();
  }

  void generateDescription() {
    if (amount != null) {
      generatedDescription = '$amount';
    }
    if (unit != null) {
      generatedDescription = '$generatedDescription $unit';
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
    unit = 'sats';

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

  void saveOffer(BuildContext context) {
    print('Offer is being saved');
    Navigator.pop(context);
  }
}
