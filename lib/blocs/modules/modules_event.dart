import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flutter/cupertino.dart';
import 'package:sequencer/models/module.dart';

@immutable
abstract class ModulesEvent extends Equatable {
  ModulesEvent([List props = const []]) : super(props);
}

class UpdateModule extends ModulesEvent {
  final String id;
  final Offset updatedPosition;

  UpdateModule(
    this.id,
    this.updatedPosition
  );

  @override
  String toString() => 'UpdateModule { updatedPosition: $updatedPosition, id: $id }';
}

// class DeleteModule extends ModulesEvent {
//   final Module module;

//   DeleteModule(this.module) : super([module]);

//   @override
//   String toString() => 'DeleteModule { module: $module }';
// }