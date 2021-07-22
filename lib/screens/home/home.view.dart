import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:haiporo/components/custom_app_bar.dart';
import 'package:haiporo/constants/size_constant.dart';
import 'package:haiporo/screens/app.module.dart';
import 'package:haiporo/screens/home/home.cubit.dart';
import 'package:haiporo/screens/home/home.module.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeCubit _homeCubit = HomeCubit();
  final actions = <Widget>[
    IconButton(
      icon: Icon(Icons.star),
      onPressed: () => Modular.to.pushNamed(
        AppModule.home + HomeModule.favorite,
      ),
    ),
    IconButton(
      icon: Icon(Icons.search),
      onPressed: () => Modular.to.pushNamed(
        AppModule.home + HomeModule.search,
      ),
    ),
  ];
  final leading = IconButton(
    icon: Icon(Icons.settings),
    onPressed: () => Modular.to.pushNamed(
      AppModule.home + HomeModule.setting,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: _homeCubit,
      builder: (context, state) => Scaffold(
        appBar: appBar(
          context,
          title: Text("PORO"),
          actions: actions,
          leading: leading,
        ),
        body: Container(
          child: ListView(
            children: [
              for (var theme in _homeCubit.themes)
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage("assets/images/themes/${theme.name}.png"),
                      fit: BoxFit.cover,
                    ),
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  margin: EdgeInsets.symmetric(
                      horizontal: SizeConstant.safeBlockHorizontal * 2,
                      vertical: SizeConstant.safeBlockHorizontal * 1),
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConstant.safeBlockHorizontal * 5),
                  height: SizeConstant.safeBlockVertical * 10,
                  child: InkWell(
                    child: Row(
                      children: [
                        Container(
                          width: SizeConstant.blockSizeHorizontal * 10,
                          height: SizeConstant.blockSizeHorizontal * 10,
                          child: Image(
                            fit: BoxFit.fill,
                            image: AssetImage(
                                "assets/images/themes/${theme.name}.png"),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              theme.name,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConstant.safeBlockHorizontal * 5,
                              ),
                            ),
                            Text(
                              theme.description,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConstant.safeBlockHorizontal * 5,
                              ),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        ),
                        FutureBuilder(
                            future: _homeCubit.getThemeProgress(theme.id),
                            builder: (context, snapshot) {
                              return CircularProgressIndicator(
                                value: snapshot.data as double,
                                backgroundColor: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.5),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  //     Theme.of(context).primaryColor),
                                  // // strokeWidth: 20,
                                  Colors.black,
                                ),
                              );
                            }),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    onTap: () => Modular.to
                        .pushNamed(AppModule.category, arguments: theme),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
