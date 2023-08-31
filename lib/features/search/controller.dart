import 'package:flutter_flutter/modules/note.dart';

class SearchController{

  SearchController({ required this.notes});
  final List<Note>notes;
  List<Note>filterNotes=[];

  Future<void> search(String? value)async {
    filterNotes.clear();
    if(value==null||value.trim().isEmpty){
      return;
    }
    for(var note in notes){
      if(note.title.toLowerCase().contains(value.toLowerCase())){
        filterNotes.add(note);
      }
    }
  }
}