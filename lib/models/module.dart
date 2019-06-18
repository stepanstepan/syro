import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

@immutable
class Module extends Equatable {
  
  final Offset position;
  final String id;

  Module(this.position, [String id]) 
    : this.id = id ?? Uuid().v4(),
      super([position, id]);

  @override
  String toString() {
    return 'Module { id: $id, position: $position }';
  }

}