import 'package:flutter/material.dart';
import 'dart:io';
import 'Notes.dart';
import 'NoteDetail.dart';
import 'package:flutter/services.dart';

class Note {
  final String title;
  final String content;

  Note(this.title, this.content);

  Note.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        content = json['content'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
      };
}

class NoteState extends State<MyNote> {
  Note note = new Note('', '');
  final _biggerFont = const TextStyle(fontSize: 18.0);

  NoteState(Note newNote) {
    note = newNote;
  }

  copyNote() {
    stdout.writeln('a new print line is called.');
    ClipboardData data = new ClipboardData(text: note.content);
    Clipboard.setData(data);
  }

  @override
  Widget build(BuildContext context) {
    
    return ListTile(
      title: Text(
        note.title,
        style: _biggerFont,
      ),
      subtitle: Text(note.content),
      trailing: IconButton(
        icon: const Icon(Icons.content_copy, semanticLabel: 'Copy note'),
        color: Colors.amber,
        onPressed: copyNote(),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NoteDetail(note: note)));
      },
    );
  }
}

class MyNote extends StatefulWidget {
  final Note note;
  MyNote({Key key, @required this.note}): super(key:key);

  @override
  NoteState createState() => NoteState(note);
}
