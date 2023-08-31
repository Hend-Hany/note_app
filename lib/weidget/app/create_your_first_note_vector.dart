import 'package:flutter/cupertino.dart';
import 'package:flutter_flutter/core/dimentions.dart';
import 'package:flutter_flutter/weidget/app/app_text.dart';

class CreateYourFirstNoteVector extends StatelessWidget {
  const CreateYourFirstNoteVector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/create_your_first_note.png',
            height: 286.height,
            width:350.width ,
            fit:BoxFit.fill ,
          ),
          SizedBox(height: 6.height,),
          AppText(
              title: 'Create your first note !',
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ],
      ),
    );
  }
}
