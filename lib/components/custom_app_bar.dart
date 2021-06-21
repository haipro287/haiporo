import 'package:flutter/material.dart';

PreferredSizeWidget appBar(BuildContext context,
        {Widget title,
        List<Widget> actions,
        Widget leading,
        bool centerTitle = true}) =>
    AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: title,
      centerTitle: centerTitle,
      actions: actions,
      leading: leading,
    );
