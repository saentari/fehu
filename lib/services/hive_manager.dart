import 'package:hive/hive.dart';

import '../models/offer.dart';

class HiveManager {
  final _box = Hive.box('offerBox');

  int getBoxLength() {
    return _box.length;
  }

  Future<void> addToBox({
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
    recurrencePaywindow,
    nodeId,
    sendInvoice,
    signature,
  }) async {
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
      recurrencePaywindow,
      nodeId,
      sendInvoice,
      signature,
    );

    await _box.add(offer);
  }

  Future<Offer> getFromBox(int index) async {
    Offer offer = await _box.getAt(index);

    return offer;
  }

  Future<void> putInBox(
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
    recurrencePaywindow,
    nodeId,
    sendInvoice,
    signature,
  }) async {
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
      recurrencePaywindow,
      nodeId,
      sendInvoice,
      signature,
    );

    await _box.put(index, offer);
  }
}
