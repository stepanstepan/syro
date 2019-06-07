import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:random_string/random_string.dart' as random;

@immutable
class Module extends Equatable {
  final String id = random.randomAlphaNumeric(10);
  final Offset position;
  final String type;

  Module(this.position, this.type, {String id}) : super([position, type, id]);

  @override
  String toString() {
    return 'Module { id: $id, position: $position, type: $type }';
  }

}