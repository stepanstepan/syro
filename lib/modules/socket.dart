import 'package:flutter/cupertino.dart';

class Socket extends StatelessWidget {

  Socket({this.filled = false, this.name = ''});
  final bool filled;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 14,
          height: 14,
          margin: EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            color: filled ? Color(0xffff7f17) : Color(0x00ff7f17),
            border: Border.all(color: Color(0xffff7f17), width: 3),
            borderRadius: BorderRadius.circular(8)
          ),
        ),
        Container(
          child: Text(
            name, 
            style: TextStyle(
              fontSize: 12.0,
              color: Color(0x88ff7f17),
            ),
          ),
          margin: EdgeInsets.only(right: 15),
        )
      ],
    );
  }
  
}