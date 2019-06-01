import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sequencer/models/module.dart';

@immutable
abstract class ModulesEvent extends Equatable {
  ModulesEvent([List props = const []]) : super(props);
}

class LoadModules extends ModulesEvent {
  @override
  String toString() => 'LoadModules';
}

class AddModule extends ModulesEvent {
  final Module module;

  AddModule(this.module) : super([module]);

  @override
  String toString() => 'AddModule { module: $module }';
}

class UpdateModule extends ModulesEvent {
  final Module updatedModule;

  UpdateModule(this.updatedModule) : super([updatedModule]);

  @override
  String toString() => 'UpdateModule { updatedModule: $updatedModule }';
}

class DeleteModule extends ModulesEvent {
  final Module module;

  DeleteModule(this.module) : super([module]);

  @override
  String toString() => 'DeleteModule { module: $module }';
}