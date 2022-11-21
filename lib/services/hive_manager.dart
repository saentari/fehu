import 'package:hive/hive.dart';

import '../models/offer.dart';

class HiveManager {
  final _box = Hive.box('offerBox');

  int getBoxLength() {
    return _box.length;
  }

  void addToBox({
    imagePath,
    amountMsat,
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
    bolt12,
    bolt12Unsigned,
  }) {
    var offer = Offer(
      imagePath,
      amountMsat,
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
      bolt12,
      bolt12Unsigned,
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
    imagePath,
    amountMsat,
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
    bolt12,
    bolt12Unsigned,
  }) {
    var offer = Offer(
      imagePath,
      amountMsat,
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
      bolt12,
      bolt12Unsigned,
    );

    _box.put(index, offer);
  }
}
