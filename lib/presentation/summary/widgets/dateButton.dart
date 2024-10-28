import 'package:flutter/material.dart';

class DateButton extends StatefulWidget {
  final String text1;
  final String text2;

  DateButton({required this.text1, required this.text2});

  @override
  _DateButtonState createState() => _DateButtonState();
}

class _DateButtonState extends State<DateButton> {
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
        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 18),
        decoration: BoxDecoration(
          color: _isTapped ? Colors.purple[100] : Colors.white,
          border: Border.all(color: const Color.fromARGB(255, 102, 50, 207)),
          borderRadius: BorderRadius.circular(5), 
        ),
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.text1),
            Text(widget.text2),
          ],
        ),
      ),
    );
  }
}
