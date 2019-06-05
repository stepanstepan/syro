import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:random_string/random_string.dart' as random;

@immutable
class Module extends Equatable {
  final String id = random.randomAlphaNumeric(10);
  final Offset position;
  final String type;

  Module(this.position, this.type, {String id}) : super([position, type]);

  @override
  String toString() {
    return 'Module { id: $id, position: $position, type: $type }';
  }

  // Module toEntity() {
  //   return Module(position, type);
  // }

  // static Module fromEntity(entity) {
  //   return Module(
  //     entity.position,
  //     entity.type,
  //     id: entity.id ?? random.randomString(20)
  //   );
  // }

}