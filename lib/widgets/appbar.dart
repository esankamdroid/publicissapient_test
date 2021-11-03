import 'package:flutter/material.dart';

class PublicisAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  PublicisAppBar({this.title = ''});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, kToolbarHeight);
}
