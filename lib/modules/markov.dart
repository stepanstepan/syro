import 'package:flutter/cupertino.dart';
import 'package:markov_dart/markov_dart.dart';
import 'dart:async';
import 'dart:math';
import 'package:sequencer/modules/base.dart';

class Markov extends StatefulWidget {

  Offset position;
  String id;
  Markov({
    @required this.position,
    @required this.id
  });

  @override
  State<Markov> createState() => _MarkovState(position: position);

}

class _MarkovState extends State<Markov> {

  Offset position;
  _MarkovState({@required this.position});

  onTap() {
    var _chain = new MarkovChain<String>(1);
    var _notes = ["C4", "B3", "C3#", "D3", "C4", "E4", "G4", "G#3"];
    _chain.add(_notes);

    final _random = new Random();

    const oneSec = const Duration(milliseconds:125);
    new Timer.periodic(oneSec, (Timer t) {
      var _note = _notes[_random.nextInt(_notes.length)];
      var _seq = _chain.chain( [_note] );
      // _chain.add(_seq);
      print(_seq);
      // print(new DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Base(
      width: 300,
      height: 150,
      position: position,
      name: 'Markov Chain',
      inputs: ['clock in'],
      outputs: ['cv out', 'gate out'],
      child: Container(
        color: Color(0xffff00ff)
      )
    );
  }
}