import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:haiporo/components/custom_app_bar.dart';
import 'package:haiporo/constants/size_constant.dart';
import 'package:haiporo/models/word/word.dart';
import 'package:haiporo/screens/category/category.module.dart';
import 'package:haiporo/screens/home/favorite/favorite.cubit.dart';

import '../../app.module.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  FavoriteCubit _favoriteCubit = FavoriteCubit();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        title: Text("Favorite"),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: _favoriteCubit.getFavorite(),
          builder: (context, snapshot) {
            return Column(
              children: [
                for (var word in _favoriteCubit.words)
                  InkWell(
                    child: Container(
                      height: SizeConstant.safeBlockVertical * 8,
                      width: SizeConstant.safeBlockHorizontal * 100,
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConstant.safeBlockHorizontal * 5),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        word.word,
                        style: TextStyle(fontSize: 20),
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Theme.of(context).accentColor),
                        ),
                      ),
                    ),
                    onTap: () => Modular.to.pushNamed(
                        AppModule.category + CategoryModule.word,
                        arguments: word),
                  ),
              ],
            );
          }
        ),
      ),
    );
  }
}
