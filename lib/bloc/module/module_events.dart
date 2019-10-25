import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class ModuleEvent extends Equatable {
  ModuleEvent([List props = const []]) : super(props);
}

class UpdateModule extends ModuleEvent {
  final String id;
  final Offset updatedPosition;

  UpdateModule(
    this.id,
    this.updatedPosition
  );

  @override
  String toString() => 'UpdateModule { updatedPosition: $updatedPosition, id: $id }';
}

class StartModule extends ModuleEvent {
  final String id;

  StartModule(
    this.id,
  );

  @override
  String toString() => 'StartModule { id: $id }';
}