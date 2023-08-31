import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../modules/note.dart';

class NoteEditorController {
  NoteEditorController({this.note});

  Note? note;

  final formKey = GlobalKey<FormState>();

  TextEditingController titleTXController= TextEditingController();
  TextEditingController subtitleTXController= TextEditingController();


   Future <Note?> addNote() async {
     if (!formKey.currentState!.validate()) {
       return null;
     }
     SharedPreferences pref = await SharedPreferences.getInstance();
     String id = DateTime
         .now()
         .millisecondsSinceEpoch
         .toString();
     List<String> cachedNotes = pref.getStringList('notes') ?? [];
     cachedNotes.insert(
       0,
       jsonEncode({
         'title': titleTXController.text,
         'subtitle': subtitleTXController.text,
         'id': id,
       }),
     );
     await pref.setStringList(
         'notes',
         cachedNotes
     );
     return Note(
       title: titleTXController.text,
       id: id,
       subtitle: subtitleTXController.text,
     );
   }
   Future<Note?> editNote()async{
     if (!formKey.currentState!.validate()) {
       return null;
     }
     SharedPreferences pref = await SharedPreferences.getInstance();
     note!.title=titleTXController.text;
     note!.subtitle=subtitleTXController.text;
     List<String> cachedNotes = pref.getStringList('notes') ?? [];
     int index=cachedNotes.indexWhere((element) {
       return jsonDecode(element)['id']==note!.id;
     });
     cachedNotes.removeAt(index);
     cachedNotes.insert(index,jsonEncode({
       'title': titleTXController.text,
       'subtitle': subtitleTXController.text,
       'id': note!.id,
     }
     ));
     await pref.setStringList(
         'notes',
         cachedNotes
     );
     return note;
   }
}



    // pref.setString(
    //   id,
    //   jsonEncode({
    //     'title': title,
    //     'subtitle': subtitle,
    //     'id': id,
    //   }),);
    // for(String i in pref.getKeys()){
    //   print(pref.getString(i));
    // }

