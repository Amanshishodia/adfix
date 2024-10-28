import 'package:flutter/material.dart';

class TimeButton extends StatefulWidget {
  final String text1;

  TimeButton({
    required this.text1,
  });

  @override
  _TimeButtonState createState() => _TimeButtonState();
}

class _TimeButtonState extends State<TimeButton> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isTapped = !_isTapped;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
        decoration: BoxDecoration(
          color: _isTapped ? Colors.purple[100] : Colors.white,
          border: Border.all(color: const Color.fromARGB(255, 214, 214, 214)),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 3), 
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,

          children: [
            Text(
              widget.text1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
