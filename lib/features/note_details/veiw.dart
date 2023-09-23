import 'package:flutter/material.dart';
import 'package:flutter_flutter/core/dimentions.dart';
import 'package:flutter_flutter/core/route_utils/route_utils.dart';
import 'package:flutter_flutter/features/home/cubit.dart';
import 'package:flutter_flutter/features/note_details/cubit.dart';
import 'package:flutter_flutter/widget/app/app_aapbar.dart';
import 'package:flutter_flutter/widget/app/app_icon_button.dart';
import 'package:flutter_flutter/widget/app/app_loading_indicator.dart';
import 'package:flutter_flutter/widget/app/app_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../note_editor/veiw.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteDetailsView extends StatelessWidget {
  const NoteDetailsView({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>NoteDetailsCubit(id: id)..getNoteDetails(),
      child: BlocBuilder<NoteDetailsCubit,NoteDetailsStates>(
        builder: (context, state) {
          final cubit= BlocProvider.of<NoteDetailsCubit>(context);
          return Scaffold(
            appBar: AppAppBar(
              actions: [
                AppIconButton(
                  icon: FontAwesomeIcons.penToSquare,
                  onTap: () async{
                    RouteUtils.push(
                      BlocProvider.value(
                        value: BlocProvider.of<HomeCubit>(context),
                        child: NoteEditorView(
                          note: cubit.note,
                        ),
                      ),
                    );
                  }
                ),
                SizedBox(width: 16,)
              ],
              enableBackButton: true,
            ),
            body: Builder(
              builder: (context) {
                if(state is NoteDetailsLoading){
                  return AppLoadingIndicator();
                }
                final note=cubit.note!;
                return ListView(
                  padding: EdgeInsets.all(16),
                  children: [
                    AppText(
                      title: note.title,
                      fontSize: 36,
                    ),
                    SizedBox(height: 16.height,),
                    AppText(
                      title: note.subtitle,
                      fontSize: 24,
                    ),
                  ],
                );
              }
            ),
          );
        }
        ),

    );
  }
}
