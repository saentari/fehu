import 'package:flutter/cupertino.dart';

class OfferAmountViewModel extends ChangeNotifier {
  var confirmed = false;
  var amountTextController = TextEditingController();
  var unitTextController = TextEditingController();

  late int amount;
  late String currency;

  void initialise(BuildContext context, int amount, String currency) {
    this.amount = amount;
    this.currency = currency;
    amountTextController.addListener(validateAmount);
    unitTextController.addListener(validateCurrency);
    // replace default amount if previously set.
    if (amount.toString().isNotEmpty) {
      amountTextController.text = amount.toString();
    }
    if (amount.toString().isNotEmpty) {
      unitTextController.text = currency.toString();
    }
    notifyListeners();
  }

  void validateAmount() {
    if (amountTextController.text.isNotEmpty) {
      amount = int.parse(amountTextController.text);
      if (amount >= 0) {
        amount = int.parse(amountTextController.text);
        confirmed = true;
      } else {
        confirmed = false;
      }
    } else {
      confirmed = false;
    }
    notifyListeners();
  }

  void validateCurrency() {
    if (unitTextController.text.isNotEmpty) {
      currency = unitTextController.text;
      if (currency == 'sats' || currency == 'msat') {
        confirmed = true;
      } else {
        confirmed = false;
      }
    } else {
      confirmed = false;
    }
    notifyListeners();
  }
}
