import 'package:hive/hive.dart';

import '../models/offer.dart';

class HiveManager {
  final _box = Hive.box('offerBox');

  int getBoxLength() {
    return _box.length;
  }

  void addToBox({
    currency,
    amount,
    description,
    absoluteExpiry,
    vendor,
    quantityMin,
    quantityMax,
    recurrence,
    recurrenceBase,
    recurrenceLimit,
    recurrencePayWindow,
    nodeId,
    sendInvoice,
    signature,
  }) {
    var offer = Offer(
      currency,
      amount,
      description,
      absoluteExpiry,
      vendor,
      quantityMin,
      quantityMax,
      recurrence,
      recurrenceBase,
      recurrenceLimit,
      recurrencePayWindow,
      nodeId,
      sendInvoice,
      signature,
    );

    _box.add(offer);
  }

  void deleteFromBox(int index) {
    _box.deleteAt(index);
  }

  Offer getFromBox(int index) {
    Offer offer = _box.getAt(index);

    return offer;
  }

  void putInBox(
    int index, {
    currency,
    amount,
    description,
    absoluteExpiry,
    vendor,
    quantityMin,
    quantityMax,
    recurrence,
    recurrenceBase,
    recurrenceLimit,
    recurrencePayWindow,
    nodeId,
    sendInvoice,
    signature,
  }) {
    var offer = Offer(
      currency,
      amount,
      description,
      absoluteExpiry,
      vendor,
      quantityMin,
      quantityMax,
      recurrence,
      recurrenceBase,
      recurrenceLimit,
      recurrencePayWindow,
      nodeId,
      sendInvoice,
      signature,
    );

    _box.put(index, offer);
  }
}
