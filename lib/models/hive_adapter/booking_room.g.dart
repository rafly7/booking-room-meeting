// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_room.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookingRoomAdapter extends TypeAdapter<BookingRoom> {
  @override
  final int typeId = 0;

  @override
  BookingRoom read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookingRoom(
      id: fields[0] as int,
      availableRoom: fields[1] as AvailableRoom,
      date: fields[2] as String?,
      time: fields[3] as String?,
      meetingTitle: fields[4] as String?,
      meetingDescription: fields[5] as String?,
      guests: (fields[6] as List?)?.cast<String>(),
      status: fields[7] as StatusBookingRoom?,
    );
  }

  @override
  void write(BinaryWriter writer, BookingRoom obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.availableRoom)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.time)
      ..writeByte(4)
      ..write(obj.meetingTitle)
      ..writeByte(5)
      ..write(obj.meetingDescription)
      ..writeByte(6)
      ..write(obj.guests)
      ..writeByte(7)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookingRoomAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
