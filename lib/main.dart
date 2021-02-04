import 'package:flutter/material.dart';
import 'package:notepad/view/home.dart';
import 'widget/inherited_widget.dart';

void main() => runApp(NotepadApp());

class NotepadApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NoteInheritedWidget(
      MaterialApp(
        title: 'Notes',
        home: HomeScreen(),
      ),
    );
  }
}

