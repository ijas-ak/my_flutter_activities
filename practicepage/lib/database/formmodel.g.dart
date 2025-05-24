// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'formmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyFormAdapter extends TypeAdapter<MyForm> {
  @override
  final int typeId = 1;

  @override
  MyForm read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyForm(
      username: fields[0] as String,
      userage: fields[1] as int,
      phoneNumber: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MyForm obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.username)
      ..writeByte(1)
      ..write(obj.userage)
      ..writeByte(2)
      ..write(obj.phoneNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyFormAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
