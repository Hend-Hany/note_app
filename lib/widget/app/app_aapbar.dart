import 'package:flutter/material.dart';
import 'package:flutter_flutter/core/dimentions.dart';
import 'package:flutter_flutter/core/route_utils/route_utils.dart';
import 'package:flutter_flutter/widget/app/app_icon_button.dart';
import 'app_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar({
    Key? key,
    this.title,
    this.actions,
    this.enableBackButton=false,

  }) : super(key: key);

  final String? title;
  final List<Widget>? actions;
  final bool enableBackButton;


  @override
  Widget build(BuildContext context) {
    return AppBar(
     centerTitle: false,
      leading:enableBackButton?
      AppIconButton(
          icon: FontAwesomeIcons.chevronLeft,
          onTap: ()=>RouteUtils.pop(context),
        padding: EdgeInsets.only(left: 16),
      ):SizedBox.shrink(),
      leadingWidth:enableBackButton? 50.width+16:0,
      title: AppText(
        title: title ?? '',
        fontWeight: FontWeight.w600,
        fontSize: 42,
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;


}
