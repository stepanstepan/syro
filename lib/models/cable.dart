import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

@immutable
class Cable extends Equatable {

  final String socketOutId;
  final String socketInId;
  final Offset socketOutOffset;
  final Offset socketInOffset;
  final String id;

  Cable(
    this.socketOutId, 
    this.socketInId, 
    this.socketOutOffset, 
    this.socketInOffset, 
    [String id]
  ) 
    : this.id = id ?? Uuid().v4(),
      super([
        socketOutId, 
        socketInId, 
        socketOutOffset, 
        socketInOffset, 
        id
      ]);

  @override
  String toString() {
    return 'Cable { id: $id, socketOutId: $socketOutId, socketInId: $socketInId }';
  }

}