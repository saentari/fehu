// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OfferAdapter extends TypeAdapter<Offer> {
  @override
  final int typeId = 0;

  @override
  Offer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Offer(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as String,
      fields[3] as String?,
      fields[4] as String?,
      fields[5] as String?,
      fields[6] as String?,
      fields[7] as String?,
      fields[8] as String?,
      fields[9] as String?,
      fields[10] as String?,
      fields[11] as String?,
      fields[12] as String?,
      fields[13] as String?,
      fields[15] as String?,
      fields[16] as String?,
    )..type = fields[14] as String?;
  }

  @override
  void write(BinaryWriter writer, Offer obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.imagePath)
      ..writeByte(1)
      ..write(obj.amountMsat)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.absoluteExpiry)
      ..writeByte(4)
      ..write(obj.vendor)
      ..writeByte(5)
      ..write(obj.quantityMin)
      ..writeByte(6)
      ..write(obj.quantityMax)
      ..writeByte(7)
      ..write(obj.recurrence)
      ..writeByte(8)
      ..write(obj.recurrenceBase)
      ..writeByte(9)
      ..write(obj.recurrenceLimit)
      ..writeByte(10)
      ..write(obj.recurrencePayWindow)
      ..writeByte(11)
      ..write(obj.nodeId)
      ..writeByte(12)
      ..write(obj.sendInvoice)
      ..writeByte(13)
      ..write(obj.signature)
      ..writeByte(14)
      ..write(obj.type)
      ..writeByte(15)
      ..write(obj.bolt12)
      ..writeByte(16)
      ..write(obj.bolt12Unsigned);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OfferAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
