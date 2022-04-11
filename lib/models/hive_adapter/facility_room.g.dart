// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_room.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FacilityRoomAdapter extends TypeAdapter<FacilityRoom> {
  @override
  final int typeId = 2;

  @override
  FacilityRoom read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FacilityRoom(
      content: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FacilityRoom obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FacilityRoomAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
