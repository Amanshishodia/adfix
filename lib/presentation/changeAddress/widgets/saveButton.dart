import 'package:flutter/material.dart';

class Savebutton extends StatefulWidget {
  final String text1;

  Savebutton({
    required this.text1,
  });

  @override
  _SavebuttonState createState() => _SavebuttonState();
}

class _SavebuttonState extends State<Savebutton> {
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
          color: _isTapped ? Colors.grey[300] : Colors.white,
          border: _isTapped
              ? Border.all(color: const Color.fromARGB(149, 0, 0, 0))
              : Border.all(color: const Color.fromARGB(255, 214, 214, 214)),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
           
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text1,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
