import 'package:flutter/material.dart';
import 'package:haiporo/components/custom_app_bar.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        title: Text("Favorite"),
        actions: [],
      ),
    );
  }
}
