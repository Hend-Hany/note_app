import 'package:flutter/cupertino.dart';
import 'package:flutter_flutter/core/dimentions.dart';
import 'package:flutter_flutter/widget/app/app_text.dart';

class NoSearchResultVector extends StatelessWidget {
  const NoSearchResultVector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/no_search_result.png',
            height: 240.height,
            width:370.width ,
            fit:BoxFit.fill ,
          ),
          SizedBox(height: 6.height,),
          AppText(
            title: 'Note not found. Try searching again.',
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ],
      ),
    );
  }
}
