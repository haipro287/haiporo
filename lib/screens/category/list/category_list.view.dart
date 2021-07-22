import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:haiporo/components/custom_app_bar.dart';
import 'package:haiporo/config/themes/font_family.dart';
import 'package:haiporo/constants/size_constant.dart';
import 'package:haiporo/models/category/word-category.dart';
import 'package:haiporo/screens/category/category.module.dart';
import 'package:haiporo/screens/category/list/category_list.cubit.dart';

import '../../app.module.dart';

class CategoryList extends StatefulWidget {
  final WordCategory category;

  CategoryList(this.category);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final double height = 120;

  CategoryListCubit _categoryListCubit;

  @override
  void initState() {
    super.initState();
    _categoryListCubit = CategoryListCubit(widget.category.id);
  }

  @override
  void dispose() {
    super.dispose();
    _categoryListCubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        title: Text(widget.category.description),
        actions: [
          IconButton(icon: Icon(Icons.filter_alt_outlined), onPressed: () {})
        ],
      ),
      body: BlocBuilder<CategoryListCubit, CategoryListState>(
        bloc: _categoryListCubit,
        builder: (context, state) => ListView(
          children: [
            for (var word in _categoryListCubit.words)
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: SizeConstant.safeBlockHorizontal * 2,
                    vertical: SizeConstant.safeBlockHorizontal * 1),
                height: height,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(1),
                      spreadRadius: 0,
                      blurRadius: 5,
                      offset: Offset(4, 4),
                    ),
                  ],
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: InkWell(
                  child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constrains) {
                      return Stack(
                        children: [
                          Positioned(
                            child: Column(
                              children: [
                                IconButton(
                                  icon: word.right >= 3
                                      ? Icon(Icons.check_circle)
                                      : Icon(Icons.check_circle_outline),
                                  onPressed: () {},
                                ),
                                BlocBuilder<CategoryListCubit,
                                    CategoryListState>(
                                  bloc: _categoryListCubit,
                                  builder: (context, state) {
                                    return IconButton(
                                      icon: word.fav != 0
                                          ? Icon(Icons.star)
                                          : Icon(Icons.star_border),
                                      onPressed: () async {
                                        await _categoryListCubit.clickFav(word);
                                        await _categoryListCubit.getThemeWord(widget.category.id);
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                            right: 0,
                          ),
                          Row(
                            children: [
                              Container(
                                width: SizeConstant.blockSizeHorizontal * 20,
                                child: Image(
                                  image: AssetImage(
                                      "assets/images/words/${word.word}.png"),
                                ),
                              ),
                              SizedBox(
                                width: constrains.maxWidth - height,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      word.word,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              SizeConstant.safeBlockVertical *
                                                  3),
                                    ),
                                    Text(
                                      word.pronounce,
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontFamily:
                                              CustomFontFamily.openSans),
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        await _categoryListCubit
                                            .getTTS(word.word);
                                      },
                                      icon: Icon(Icons.volume_up),
                                    ),
                                    FittedBox(
                                        child: Text(word.description
                                            .split(RegExp(r"(, |; | \()"))[0])),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                  onTap: () {
                    Modular.to.pushNamed(
                        AppModule.category + CategoryModule.word,
                        arguments: word);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
