import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

@immutable
class Cable extends Equatable {

  final Offset startPosition;
  final Offset endPosition;
  final String startModuleId;
  final String endModuleId;
  final String id;

  Cable(
    this.startPosition, 
    this.endPosition, 
    this.startModuleId, 
    this.endModuleId, 
    [String id]
  ) 
    : this.id = id ?? Uuid().v4(),
      super([
        startPosition, 
        endPosition, 
        startModuleId, 
        endModuleId, 
        id
      ]);

  @override
  String toString() {
    return 'Cable { id: $id, startPosition: $startPosition, endPosition: $endPosition }';
  }

}