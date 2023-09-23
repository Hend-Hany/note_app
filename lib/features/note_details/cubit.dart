import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flutter/core/network_utils.dart';
import 'package:flutter_flutter/modules/note.dart';

part 'state.dart';


class NoteDetailsCubit extends Cubit<NoteDetailsStates>{
  NoteDetailsCubit({required this.id}): super(NoteDetailsInit());

  final String id;

  Note? note;

  Future<void>getNoteDetails()async{
    emit(NoteDetailsLoading());
    try{
      final response =await NetworkUtils.get('note/$id');
      note =Note.fromJson(response.data);
    }catch(e,s){
      print(e);
      print(s);
    }
    emit(NoteDetailsInit());
  }
}