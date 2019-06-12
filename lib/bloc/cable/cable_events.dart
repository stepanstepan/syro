import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class CableEvent extends Equatable {
  CableEvent([List props = const []]) : super(props);
}

class UpdateCable extends CableEvent {
  final String id;
  final Offset updatedStart;
  final Offset updatedEnd;

  UpdateCable(
    this.id,
    this.updatedStart,
    this.updatedEnd,
  );

  @override
  String toString() => 'UpdateCable { updatedStart: $updatedStart, id: $id }';
}