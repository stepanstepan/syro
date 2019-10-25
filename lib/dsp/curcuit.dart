import 'package:sequencer/dsp/nodes/node.dart';

class Circuit {
  Map<String, Node> nodes = {};

  addNode(Node node) {
    if (!nodes.containsKey(node.id)) {
      print('adding $node');
      nodes[node.id] = node;
    }
  }

  removeNode(int nodeIndex) {
    
  }

  connectOutToIn(String nodeOutId, String outId, String nodeInId, String inId) {
    final node = nodes[nodeOutId];
    node.connect(outId, nodes[nodeInId], inId);
    print('added $nodeOutId');
  }

  disconnect() {

  }

}