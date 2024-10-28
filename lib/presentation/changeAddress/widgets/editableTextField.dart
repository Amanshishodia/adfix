import 'package:flutter/material.dart';

class EditableTextField extends StatefulWidget {
  final String initialText;

  const EditableTextField({Key? key, required this.initialText})
      : super(key: key);

  @override
  _EditableTextFieldState createState() => _EditableTextFieldState();
}

class _EditableTextFieldState extends State<EditableTextField> {
  late TextEditingController _controller;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(157, 0, 0, 0)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SizedBox(width: 8),
            Icon(Icons.phone, color: Colors.grey[800]),
            SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: _controller,
                enabled: _isEditing,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              icon: Icon(_isEditing ? Icons.save : Icons.edit,
                  color: Colors.grey[800]),
              onPressed: () {
                setState(() {
                  _isEditing = !_isEditing;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
