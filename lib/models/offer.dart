import 'package:hive/hive.dart';

part 'offer.g.dart';

@HiveType(typeId: 0)
class Offer {
  // The uniquely generated id for the [Wallet].
  @HiveField(0)
  String? currency;

  // Customizable name given to the [Wallet].
  @HiveField(1)
  String? amount;

  // Read-only `address` wallet or full `mnemonic` wallet type.
  @HiveField(2)
  String description;

  // Generates addresses and sets the network.
  @HiveField(3)
  String? absoluteExpiry;

  // Stores [Address] data such as transactions and balances.
  @HiveField(4)
  String? vendor;

  // The unique id for the background image.
  @HiveField(5)
  String? quantityMin;

  // The file path where the background image is stored.
  @HiveField(6)
  String? quantityMax;

  // The preferred fiat currency: default `USD`.
  @HiveField(7)
  String? recurrence;

  // The preferred value denominator: default `BTC`.
  @HiveField(8)
  String? recurrenceBase;

  // The preferred value denominator: default `BTC`.
  @HiveField(9)
  String? recurrenceLimit;

  // The preferred value denominator: default `BTC`.
  @HiveField(10)
  String? recurrencePayWindow;

  // The preferred value denominator: default `BTC`.
  @HiveField(11)
  String? nodeId;

  // The preferred value denominator: default `BTC`.
  @HiveField(12)
  String? sendInvoice;

  // The preferred value denominator: default `BTC`.
  @HiveField(13)
  String? signature;

  Offer(
    this.currency,
    this.amount,
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
  );
}
