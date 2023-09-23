import 'package:flutter/material.dart'hide SearchController;
import 'package:flutter_flutter/core/dimentions.dart';
import 'package:flutter_flutter/widget/app/app_aapbar.dart';
import 'package:flutter_flutter/widget/app/search_text_field.dart';


class SearchView extends StatelessWidget {
  const SearchView({Key? key,}) : super(key: key);


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

              },
            ),
            SizedBox(height: 24.height,),
            Expanded(child: Builder(
              builder: (context) {
              // if(controller.filterNotes.isEmpty){
              //   return NoSearchResultVector();
              // }
              // return ListView.builder(
              //     itemCount: controller.filterNotes.length,
              //     itemBuilder: (context,index){
              //       return NoteCard(note:controller.filterNotes[index] ,);
              //     }
              // );
                return SizedBox();
            },
            )
            ),
          ],
        ),
      ),
    );
  }
}
