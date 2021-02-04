import 'package:flutter/material.dart';

enum NoteMode{
  Editing,
  Adding
}

class NewNote extends StatefulWidget {
  final NoteMode _noteMode;
  Note(this._noteMode);

  @override
  _NewNoteState createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            _noteMode == NoteMode.Adding ? "Add Note" : "Edit Note"
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: 'Title'
              ),
            ),
            Container(height: 5,),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Text'
              ),
            ),
            Container(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _NoteButton('Save', Colors.blue, () {
                  Navigator.pop(context);
                }),
                _NoteButton('Discard', Colors.grey, () {
                  Navigator.pop(context);
                }),
                _noteMode == NoteMode.Editing ?
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: _NoteButton('Delete', Colors.red, () {
                    Navigator.pop(context);
                  }),
                )
                  : Container()
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class _NoteButton extends StatelessWidget {

  final String _text;
  final Color _color;
  final _onPressed;

  _NoteButton(this._text, this._color, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: _onPressed,
      child: Text(
        _text,
        style: TextStyle(color: Colors.white),
      ),
      color: _color,
    );
  }
}
