import 'package:flutter/cupertino.dart';

class Socket extends StatelessWidget {

  
  final bool filled;
  final String name;

  Socket({
    this.filled = false, 
    this.name = ''
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 14,
      height: 14,
      // margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: filled ? Color(0xffff7f17) : Color(0x00ff7f17),
        border: Border.all(color: Color(0xffff7f17), width: 3),
        borderRadius: BorderRadius.circular(8)
      ),
    );
  }
  
}