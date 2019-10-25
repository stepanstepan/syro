import 'package:uuid/uuid.dart';
import 'package:sequencer/dsp/tick.dart';
import 'package:equatable/equatable.dart';

abstract class Node extends Equatable {

  final String id;
  List<String> inputs;
  Map<String, Map<String, List<dynamic>>> outputs;

  Node(
    [String id]
  ) 
    : this.id = id ?? Uuid().v4(),
      super([id]);

  // final outputs = {
  //   'output_id': {
  //     'node_id': [Node, 'input_id'],
  //     'node_id': [Node, 'input_id']
  //   }
  // };


  connect(String output, Node node, String input) {
    if (outputs.containsKey(output)) {
      outputs[output][node.id] = [node, input];
    }
  }

  disconnect() {

  }

  input(Tick tick, String input) {
    output(tick);
  }

  output(Tick tick) {
    outputs.values.forEach((output) {
      output.values.forEach((List<dynamic> nodeData) {
        nodeData[0].input(tick, nodeData[1]);
      });
    });
  }

  @override
  String toString() {
    return 'Node id $id';
  }

}