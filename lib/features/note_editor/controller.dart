import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_flutter/modules/note.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteEditorController {
  NoteEditorController({this.note});

  Note? note;

  final formKey = GlobalKey<FormState>();

  TextEditingController titleTXController = TextEditingController();
  TextEditingController subtitleTXController = TextEditingController();

  Future<Note?> addNote() async {
    if (!formKey.currentState!.validate()) {
      return null;
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    List<String> cachedNotes = prefs.getStringList('notes') ?? [];
    cachedNotes.insert(
      0,
      jsonEncode({
        'title': titleTXController.text,
        'subtitle': subtitleTXController.text,
        "id": id,
      }),
    );
    await prefs.setStringList(
      'notes',
      cachedNotes,
    );
    return Note(id: id,
      subtitle: subtitleTXController.text,
      title: titleTXController.text,
    );
  }
  Future<Note?> editNote() async {
    if (!formKey.currentState!.validate()) {
      return null;
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    note!.title=titleTXController.text;
    note!.subtitle=subtitleTXController.text;
    List<String> cachedNotes = prefs.getStringList('notes') ?? [];
    int index=cachedNotes.indexWhere((element) {
      return jsonDecode(element)['id']==note!.id;
    });
    cachedNotes.removeAt(index);
    cachedNotes.insert(
      index,
      jsonEncode({
        'title': titleTXController.text,
        'subtitle':subtitleTXController.text,
        "id":note!.id,
      }),
    );
    await prefs.setStringList(
      'notes',
      cachedNotes,
    );
    return note;
  }
}
