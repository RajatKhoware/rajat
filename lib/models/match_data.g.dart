// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GlobalMatchDataAdapter extends TypeAdapter<GlobalMatchData> {
  @override
  final int typeId = 2;

  @override
  GlobalMatchData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GlobalMatchData(
      matchId: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GlobalMatchData obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.matchId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GlobalMatchDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
