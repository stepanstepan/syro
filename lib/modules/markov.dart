import 'package:flutter/cupertino.dart';
import 'package:markov_dart/markov_dart.dart';
import 'dart:async';
import 'dart:math';
import 'package:sequencer/modules/base.dart';

class Markov extends StatefulWidget {

  Markov({@required this.x, @required this.y});
  final double x;
  final double y;

  @override
  State<Markov> createState() => _MarkovState(x: x, y: y);

}

class _MarkovState extends State<Markov> {

  _MarkovState({@required this.x, @required this.y});
  final double x;
  final double y;

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
      x: x,
      y: y,
      name: 'Markov Chain',
      inputs: ['clock in'],
      outputs: ['cv out', 'gate out'],
      content: Container(
        color: Color(0xffff00ff)
      )
    );
  }
}