import 'package:flutter/material.dart';
import 'Note.dart';
import 'Notes.dart';
import 'NewNote.dart';
import 'NoteDetail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ONTE Here',
      home: MyNotes(),
      routes: {
        NewNote.routeName: (context) => NewNote(),
        NoteDetail.routeName: (context) => NoteDetail(),
      },
    );
  }
}

class MyNotesState extends State<MyNotes> {

  MyNotesState() {
    //load notes from the data base.
    Notes.fetchNotesFromServer();
  }


  Widget _buildEor() {
    return ListTile(
      title: Text('End of List'),
      leading: Icon(
        Icons.note_add,
        color: Colors.orangeAccent,
      ),
    );
  }


  
  Widget _buildNotes() {
    List<Note> availableNotes =  Notes.getNotes();
    int notesLength = availableNotes.length;

    notesLength = notesLength + notesLength + 1;
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: notesLength,
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();
          final index = i ~/ 2;
          if (index < availableNotes.length) {
//          what to do here?
            return MyNote(note: availableNotes[index]);
          }
          return _buildEor();
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ONTE'),
      ),
      body: _buildNotes(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        child: Icon(Icons.note_add),
        onPressed: ()=>
        Navigator.pushNamed(context, NewNote.routeName),
      ),
    );
  }
}

class MyNotes extends StatefulWidget {
  @override
  MyNotesState createState() => MyNotesState();
}
