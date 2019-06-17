import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

@immutable
class Cable extends Equatable {
  
  final List source;
  final List target;
  final String id;

  Cable(
    this.source,
    this.target,
    [String id]
  ) 
    : this.id = id ?? Uuid().v4(),
      super([
        source,
        target,
        id
      ]);

  @override
  String toString() {
    return 'Cable { id: $id, source: $source, target: $target }';
  }

}