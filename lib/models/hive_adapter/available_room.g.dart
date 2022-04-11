// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_room.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AvailableRoomAdapter extends TypeAdapter<AvailableRoom> {
  @override
  final int typeId = 1;

  @override
  AvailableRoom read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AvailableRoom(
      id: fields[0] as int,
      path: fields[1] as String,
      title: fields[2] as String,
      subTitle: fields[3] as String,
      facilitys: (fields[4] as List).cast<FacilityRoom>(),
      capacity: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, AvailableRoom obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.path)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.subTitle)
      ..writeByte(4)
      ..write(obj.facilitys)
      ..writeByte(5)
      ..write(obj.capacity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AvailableRoomAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
