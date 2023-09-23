import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flutter/core/network_utils.dart';
import 'package:flutter_flutter/features/home/state.dart';
import 'package:flutter_flutter/modules/note.dart';
import 'package:flutter_flutter/widget/app/snack_bar.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit():super(HomeInit());

  int currentNotesPage=1;
  List<Note>notes=[];
  int? totalNotePages;

  Future<void>getNotes()async{
    notes.clear();
    currentNotesPage=1;
    emit(HomeLoading());
    try{
      final response =await NetworkUtils.get('note?page=$currentNotesPage');
      totalNotePages=response.data['total'];
      for(var i in response.data['notes']){
        notes.add(Note.fromJson(i));
      }
    }catch(e){
      print(e);
    }
    emit(HomeInit());
  }
  Future<void>getMoreNotes()async{
    currentNotesPage++;
    emit(HomeMoreLoading());
    try{
      final response =await NetworkUtils.get('note?page=$currentNotesPage');
      for(var i in response.data['notes']){
        notes.add(Note.fromJson(i));
      }
    }catch(e){
      currentNotesPage--;
    }
    emit(HomeInit());
  }
  void insertNote(Note note){
    notes.insert(0, note);
    emit(HomeInit());
}
  void editNote(Note note){
    notes.removeWhere((element) => element.id==note.id);
    notes.insert(0, note);
    emit(HomeInit());
  }
  Future<void>deleteNotes(Note note)async{
    try{
      final response =await NetworkUtils.delete('note?page=${note.id}');
      if(response.statusCode==200){
        notes.remove(note);
        showSnackBar('Note Deleted Successfully!');
      }else{
        showSnackBar(response.data['message'],error: true);
      }
    }catch(e){
      showSnackBar('Failed try again!',error: true);
      print(e);
    }
    emit(HomeInit());
  }
}

