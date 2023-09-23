import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flutter/core/network_utils.dart';
import 'package:flutter_flutter/modules/note.dart';
import 'package:flutter_flutter/widget/app/snack_bar.dart';

part 'state.dart';

class NoteEditorCubit extends Cubit<NoteEditorStates> {
  NoteEditorCubit({required this.note}) : super(NoteEditorInit());

  final Note? note;

  final formKey = GlobalKey<FormState>();

  TextEditingController titleTXController = TextEditingController();
  TextEditingController subtitleTXController = TextEditingController();

  void init() {
    titleTXController.text = note?.title ?? '';
    subtitleTXController.text = note?.subtitle ?? '';
  }

  bool validateInputs() {
    return formKey.currentState!.validate();
  }

  Future<Note?> addNote() async {
    emit(NoteEditorLoading());
    try {
      final response = await NetworkUtils.post(
        'note',
        data:{
          'title':titleTXController.text,
          'subtitle':subtitleTXController.text
        }
      );
      if (response.statusCode==200) {
        showSnackBar("Note Added Successfully!");
        return Note.fromJson(response.data);
      }  else{
        showSnackBar(response.data['message'],error: true);
      }
    } catch (e, s) {
      showSnackBar('Failed try again!',error: true);
      print(e);
      print(s);
    }
    emit(NoteEditorInit());
    return null;
  }
  Future<Note?> editNote() async {
    emit(NoteEditorLoading());
    try {
      final response = await NetworkUtils.patch(
          'note/${note!.id}',
          data:{
            'title':titleTXController.text,
            'subtitle':subtitleTXController.text
          }
      );
      if (response.statusCode==200) {
        showSnackBar("Note Edited Successfully!");
        return Note.fromJson(response.data);
      }  else{
        showSnackBar(response.data['message'],error: true);
      }
    } catch (e, s) {
      showSnackBar('Failed try again!',error: true);
      print(e);
      print(s);
    }
    emit(NoteEditorInit());
    return null;
  }
}
