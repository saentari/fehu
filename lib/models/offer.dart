import 'package:hive/hive.dart';

part 'offer.g.dart';

@HiveType(typeId: 0)
class Offer {
  // The file path where the background image is stored.
  @HiveField(0)
  String? imagePath;

  // All fiat or bitcoin units are converted to msat amounts.
  @HiveField(1)
  String? amountMsat;

  // Custom description of bolt12 offer.
  @HiveField(2)
  String description;

  // The absoluteExpiry.
  @HiveField(3)
  String? absoluteExpiry;

  // The vendor name/domain.
  @HiveField(4)
  String? vendor;

  // The lower [amountMsat] limit.
  @HiveField(5)
  String? quantityMin;

  // The upper [amountMsat] limit.
  @HiveField(6)
  String? quantityMax;

  // Describes how often it reoccurs (e.g. 1minute).
  @HiveField(7)
  String? recurrence;

  // Starting moment
  @HiveField(8)
  String? recurrenceBase;

  // Maximum recurrence limit (e.g. 3 times).
  @HiveField(9)
  String? recurrenceLimit;

  // The payment window before or after the [recurrenceBase].
  @HiveField(10)
  String? recurrencePayWindow;

  // The lightning node id.
  @HiveField(11)
  String? nodeId;

  // The sendInvoice.
  @HiveField(12)
  String? sendInvoice;

  // The signature.
  @HiveField(13)
  String? signature;

  // Bolt12 type: default `bolt12 offer`.
  @HiveField(14)
  String? type;

  // Signed bolt12 string.
  @HiveField(15)
  String? bolt12;

  // Unsigned bolt12 string.
  @HiveField(16)
  String? bolt12Unsigned;

  Offer(
    this.imagePath,
    this.amountMsat,
    this.description,
    this.absoluteExpiry,
    this.vendor,
    this.quantityMin,
    this.quantityMax,
    this.recurrence,
    this.recurrenceBase,
    this.recurrenceLimit,
    this.recurrencePayWindow,
    this.nodeId,
    this.sendInvoice,
    this.signature,
    this.bolt12,
    this.bolt12Unsigned,
  );
}
