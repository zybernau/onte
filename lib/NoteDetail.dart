import 'package:flutter/material.dart';
import 'Note.dart';
import 'Notes.dart';

class NoteDetail extends StatelessWidget {
  final Note note;
  static const String routeName = "/NoteDetail";

  NoteDetail({Key key, @required this.note}) : super(key: key);

  deleteANote(BuildContext context){
    Notes.removeNote(note);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(note.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(note.content),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Delete', // used by assistive technologies
        child: Icon(Icons.delete),
        onPressed: () => deleteANote(context),
      ),
    );
  }
}