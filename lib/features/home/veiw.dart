import 'package:flutter/material.dart';
import 'package:flutter_flutter/core/dimentions.dart';
import 'package:flutter_flutter/core/route_utils/route_utils.dart';
import 'package:flutter_flutter/features/home/controller.dart';
import 'package:flutter_flutter/widget/app/app_aapbar.dart';
import 'package:flutter_flutter/widget/app/app_colors.dart';
import 'package:flutter_flutter/widget/app/app_icon_button.dart';
import 'package:flutter_flutter/widget/app/create_your_first_note_vector.dart';
import 'package:flutter_flutter/widget/app/note_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../note_editor/veiw.dart';
import '../search/view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = HomeController();

  @override
  void initState() {
    controller.getCachedNotes().then((value) {
      setState(() {});
    });
    // getCachedNotes();
    super.initState();
  }

  // void getCachedNotes() async {
  //   await controller.getCachedNotes();
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: 'Notes',
        actions: [
          AppIconButton(
            icon: FontAwesomeIcons.magnifyingGlass,
            onTap: () {
              RouteUtils.push(
                context: context,
                view: SearchView(notes: controller.notes,),
              );
            },
          ),
          SizedBox(
            width: 20,
          ),
          AppIconButton(
            icon: FontAwesomeIcons.circleInfo,
            onTap: () {

            },
          ),
          SizedBox(
            width: 16,
          )
        ],
      ),
      body: Builder(
        builder: (context) {
          if (controller.notes.isEmpty) {
            return CreateYourFirstNoteVector();
          }
          return RefreshIndicator(
            onRefresh:()async{
              await controller.getCachedNotes();
              setState(() {

              });
            } ,
            color: AppColors.white,
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: controller.notes.length,
              itemBuilder: (context, index) {
                return NoteCard(
                  note: controller.notes[index],
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          FontAwesomeIcons.plus,
          size: 24.height,
        ),
        onPressed: ()async {
          final result=await RouteUtils.push(
            context: context,
            view: NoteEditorView(),
          );
          if(result != null){
            controller.notes.insert(0, result);
            setState(() {

            });
          }
        },
      ),
    );
  }
}
