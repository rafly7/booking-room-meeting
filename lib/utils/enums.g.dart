// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enums.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatusBookingRoomAdapter extends TypeAdapter<StatusBookingRoom> {
  @override
  final int typeId = 3;

  @override
  StatusBookingRoom read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return StatusBookingRoom.Booked;
      case 1:
        return StatusBookingRoom.Started;
      case 2:
        return StatusBookingRoom.Ended;
      case 3:
        return StatusBookingRoom.Cancelled;
      default:
        return StatusBookingRoom.Booked;
    }
  }

  @override
  void write(BinaryWriter writer, StatusBookingRoom obj) {
    switch (obj) {
      case StatusBookingRoom.Booked:
        writer.writeByte(0);
        break;
      case StatusBookingRoom.Started:
        writer.writeByte(1);
        break;
      case StatusBookingRoom.Ended:
        writer.writeByte(2);
        break;
      case StatusBookingRoom.Cancelled:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatusBookingRoomAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
