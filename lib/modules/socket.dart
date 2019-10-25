import 'package:flutter/cupertino.dart';

class Socket extends StatelessWidget {
  final bool filled;
  final String name;
  final bool input;

  Socket({
    this.filled = false, 
    this.name = '',
    this.input = true
  });

  List<Widget> _getChildren() {
    List<Widget> list = [
      Container(
        width: 14,
        height: 14,
        margin: EdgeInsets.only(right: 5, left: 5),
        decoration: BoxDecoration(
          color: filled ? Color(0xffff7f17) : Color(0x00ff7f17),
          border: Border.all(color: Color(0xffff7f17), width: 3),
          borderRadius: BorderRadius.circular(8)
        ),
      )
    ];

    list.insert(input ? 1 : 0, Text(
      name, 
      style: TextStyle(
        color: Color(0xffff7f17),
        fontSize: 12.0,
      )
    ));

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: _getChildren()
      )
    );
  }
  
}