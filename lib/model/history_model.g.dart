// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

// ignore: camel_case_types
class historymodelAdapter extends TypeAdapter<history_model> {
  @override
  final int typeId = 0;

  @override
  history_model read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return history_model(
      terim: fields[0] as String,
      turkishMeaning: fields[1] as String,
      english: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, history_model obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.terim)
      ..writeByte(1)
      ..write(obj.turkishMeaning)
      ..writeByte(2)
      ..write(obj.english);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is historymodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
