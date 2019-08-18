import 'package:flutter/material.dart';
import 'Note.dart';
import 'Notes.dart';

class NewNoteState extends State<NewNote> {
  NewNoteState() {
    //constr
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController _ctrlContent = TextEditingController();
  TextEditingController _ctrlTitle = TextEditingController();


  addaNote(BuildContext context) {
    final titleText = _ctrlTitle.text;
    final contentText = _ctrlContent.text;
    if (titleText != null &&  titleText.length > 0) {
      Note aNote = new Note(titleText, contentText);
      Notes.addNote(aNote);
      _ctrlTitle.clear();
      _ctrlContent.clear();
      Navigator.pop(context);
    }
  }

  Widget createNoteForm(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            textCapitalization: TextCapitalization.characters,
            maxLength: 10,

            validator: (value) {
              if(value.isEmpty){
                return 'Please enter value';
              }
              return null;
            },
            controller: _ctrlTitle,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: TextFormField(
              maxLines: 25,
              maxLength: 15000,
              controller: _ctrlContent,

            ),
          )
        ],

      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Note"),
      ),
      body: createNoteForm(context),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Save', // used by assistive technologies
        child: Icon(Icons.save),
        onPressed: () => addaNote(context),
      ),
    );
  }
}

class NewNote extends StatefulWidget {
  static const String routeName = "/CreateNewNote";

  @override
  NewNoteState createState() => NewNoteState();
}
