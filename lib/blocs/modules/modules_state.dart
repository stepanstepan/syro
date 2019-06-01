import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sequencer/models/module.dart';

@immutable
abstract class ModulesState extends Equatable {
  ModulesState([List props = const []]) : super(props);
}

class ModulesLoading extends ModulesState {
  @override
  String toString() => 'ModulesLoading';
}

class ModulesLoaded extends ModulesState {
  final List<Module> modules;

  ModulesLoaded([this.modules = const []]) : super([modules]);

  @override
  String toString() => 'ModulesLoaded { modules: $modules }';
}
