import 'package:equatable/equatable.dart';
import 'package:sequencer/models/module.dart';

abstract class ModulesState extends Equatable {
  ModulesState([List props = const []]) : super(props);
}

class ModulesUpdated extends ModulesState {
  final List<Module> modules;

  ModulesUpdated({
    this.modules
  }) : super([modules]);

  ModulesUpdated copyWith({
    List<Module> modules
  }) {
    return ModulesUpdated(
      modules: modules ?? this.modules
    );
  }

  @override
  String toString() => 'UpdateModule { modules: $modules }';
}