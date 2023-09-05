import 'package:flutter/material.dart'hide SearchController;
import 'package:flutter_flutter/core/dimentions.dart';
import 'package:flutter_flutter/modules/note.dart';
import 'package:flutter_flutter/widget/app/app_aapbar.dart';
import 'package:flutter_flutter/widget/app/no_search_result_vector.dart';
import 'package:flutter_flutter/widget/app/note_card.dart';
import 'package:flutter_flutter/widget/app/search_text_field.dart';
import 'controller.dart';
class SearchView extends StatefulWidget {
  const SearchView({Key? key, required this.notes}) : super(key: key);
   final List<Note> notes;
  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

 late SearchController controller;

 @override
  void initState() {
    controller=SearchController(notes: widget.notes);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SearchTextField(
              onChanged: (v){
                controller.search(v);
                setState(() {

                });
              },
            ),
            SizedBox(height: 24.height,),
            Expanded(child: Builder(
              builder: (context) {
              if(controller.filterNotes.isEmpty){
                return NoSearchResultVector();
              }
              return ListView.builder(
                  itemCount: controller.filterNotes.length,
                  itemBuilder: (context,index){
                    return NoteCard(note:controller.filterNotes[index] ,);
                  }
              );
            },
            )
            ),
          ],
        ),
      ),
    );
  }
}
