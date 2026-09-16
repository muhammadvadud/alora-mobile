import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'offline_queue_item.freezed.dart';
part 'offline_queue_item.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class OfflineQueueItem with _$OfflineQueueItem {
  const factory OfflineQueueItem({
    required String id,
    required String method,
    required String path,
    required Map<String, dynamic>? body,
    required DateTime createdAt,
    @Default(0) int attempts,
  }) = _OfflineQueueItem;

  factory OfflineQueueItem.fromJson(Map<String, dynamic> json) =>
      _$OfflineQueueItemFromJson(json);

  factory OfflineQueueItem.create({
    required String method,
    required String path,
    Map<String, dynamic>? body,
  }) {
    return OfflineQueueItem(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      method: method,
      path: path,
      body: body,
      createdAt: DateTime.now().toUtc(),
    );
  }
}

class OfflineQueueItemAdapter extends TypeAdapter<OfflineQueueItem> {
  @override
  final int typeId = 1;

  @override
  OfflineQueueItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, Object?>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OfflineQueueItem(
      id: fields[0] as String,
      method: fields[1] as String,
      path: fields[2] as String,
      body: (fields[3] as Map?)?.cast<String, dynamic>(),
      createdAt: fields[4] as DateTime,
      attempts: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, OfflineQueueItem obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.method)
      ..writeByte(2)
      ..write(obj.path)
      ..writeByte(3)
      ..write(obj.body)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.attempts);
  }
}
