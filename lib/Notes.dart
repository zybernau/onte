import 'Note.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

 class Notes {

  static List<Note> _notes = [];

  List<Note> get notes => _notes;

  static List<Note> getNotes() {
    return _notes;
  }

  static bool addNote(Note note) {
    _notes.add(note);
    return true;
  }

  static bool removeNote(Note note) {
    _notes.remove(note);
    return true;
  }

  static void fetchNotesFromServer() {
//    return StreamBuilder<

    Note note1 = new Note('n1 title', 'n1 content');
    Note note2 = new Note('n2 title', 'n2 content');
    _notes.add(note1);
    _notes.add(note2);
  }
}

