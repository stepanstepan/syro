import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:random_string/random_string.dart' as random;

// const TEST = 20;

@immutable
class Module extends Equatable {
  final String id;
  final Offset position;
  final List inputs;
  final List outputs;
  final String type;

  Module(this.position, this.inputs, this.outputs, this.type, {String id})
    : this.id = id ?? random.randomString(20),
    super([position, inputs, outputs, type, id]);

  @override
  String toString() {
    return 'Module { id: $id, position: $position, inputs: $inputs, outputs: $outputs, type: $type }';
  }

  Module toEntity() {
    return Module(position, inputs, outputs, type);
  }

  static Module fromEntity(entity) {
    return Module(
      entity.position,
      entity.inputs,
      entity.outputs,
      entity.type,
      id: entity.id ?? random.randomString(20)
    );
  }

}