import 'dart:convert';

import '../../modules/note.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController {
  List<Note> notes = [];

  Future<void> getCachedNotes() async {
    notes.clear();
    final pref = await SharedPreferences.getInstance();
    pref.getStringList('notes');
    final cachedNotes = pref.getStringList('notes') ?? [];
    for (var i in cachedNotes) {
      notes.add(
        Note(
          id: jsonDecode(i)['id'],
          subtitle: jsonDecode(i)['subtitle'],
          title: jsonDecode(i)['title'],
        ),
      );
    }
  }
}
