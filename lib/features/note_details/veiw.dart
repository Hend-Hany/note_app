import 'package:flutter/material.dart';
import 'package:flutter_flutter/core/dimentions.dart';
import 'package:flutter_flutter/core/route_utils/route_utils.dart';
import 'package:flutter_flutter/widget/app/app_aapbar.dart';
import 'package:flutter_flutter/widget/app/app_icon_button.dart';
import 'package:flutter_flutter/widget/app/app_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../modules/note.dart';
import '../note_editor/veiw.dart';

class NoteDetailsView extends StatelessWidget {
  const NoteDetailsView({Key? key, required this.note}) : super(key: key);

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        actions: [
          AppIconButton(
              icon: FontAwesomeIcons.penToSquare,
              onTap: ()async {
                final result =await RouteUtils.push(
                  context: context,
                  view: NoteEditorView(note: note,),
              );
                if(result != null){
                  Navigator.pop(context,result);
                }
              },
          ),
          SizedBox(width: 16,)
        ],
        enableBackButton: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          AppText(
            title: note.title,
            fontSize: 36,
          ),
          SizedBox(height: 16.height,),
          AppText(
            title: note.subtitle ,
            fontSize: 24,
          ),
        ],
      ),
    );
  }
}
