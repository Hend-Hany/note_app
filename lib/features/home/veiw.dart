import 'package:flutter/material.dart';
import 'package:flutter_flutter/core/caching_utils.dart';
import 'package:flutter_flutter/core/dimentions.dart';
import 'package:flutter_flutter/core/route_utils/route_utils.dart';
import 'package:flutter_flutter/features/home/cubit.dart';
import 'package:flutter_flutter/features/home/state.dart';
import 'package:flutter_flutter/features/login/view.dart';
import 'package:flutter_flutter/features/note_details/veiw.dart';
import 'package:flutter_flutter/widget/app/app_aapbar.dart';
import 'package:flutter_flutter/widget/app/app_colors.dart';
import 'package:flutter_flutter/widget/app/app_icon_button.dart';
import 'package:flutter_flutter/widget/app/app_loading_indicator.dart';
import 'package:flutter_flutter/widget/app/app_text.dart';
import 'package:flutter_flutter/widget/app/create_your_first_note_vector.dart';
import 'package:flutter_flutter/widget/app/note_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../note_editor/veiw.dart';
import '../search/view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getNotes(),
      child: Scaffold(
        appBar: AppAppBar(
          title: 'Notes',
          actions: [
            AppIconButton(
              icon: FontAwesomeIcons.magnifyingGlass,
              onTap: () => RouteUtils.push(
                SearchView(),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            AppIconButton(
              icon: FontAwesomeIcons.circleInfo,
              onTap: () async {
                await CachingUtils.deleteUser();
                RouteUtils.pushAndPopAll(
                  LoginView(),
                );
              },
            ),
            SizedBox(
              width: 16,
            )
          ],
        ),
        body: BlocBuilder<HomeCubit, HomeStates>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return AppLoadingIndicator();
            }
            final cubit = BlocProvider.of<HomeCubit>(context);
            if (cubit.notes.isEmpty) {
              return CreateYourFirstNoteVector();
            }
            final notes = cubit.notes;
            return RefreshIndicator(
              onRefresh: cubit.getNotes,
              color: AppColors.white,
              child: ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: notes.length + 1,
                  itemBuilder: (context, index) {
                    if (notes.length == index) {
                      if (state is HomeMoreLoading) {
                        return AppLoadingIndicator();
                      } else if (cubit.totalNotePages ==
                          cubit.currentNotesPage) {
                        return SizedBox.shrink();
                      }
                      return Container(
                        margin: EdgeInsets.only(bottom: 34),
                        alignment: Alignment.center,
                        child: AppText(
                          title: 'View More',
                          fontSize: 18,
                          textDecoration: TextDecoration.underline,
                          onTap: cubit.getMoreNotes,
                        ),
                      );
                    }
                    return NoteCard(
                      note: notes[index],
                      onTap: () {
                        RouteUtils.push(
                          BlocProvider.value(
                            value: cubit,
                            child: NoteDetailsView(id: notes[index].id),
                          ),
                        );
                      },
                      onDismiss: () => cubit.deleteNotes(notes[index]),
                    );
                  }),
            );
          },
        ),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            child: Icon(
              FontAwesomeIcons.plus,
              size: 24.height,
            ),
            onPressed: () async {
              await RouteUtils.push(
                BlocProvider.value(
                  value: BlocProvider.of<HomeCubit>(context),
                  child: NoteEditorView(),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
