import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haiporo/components/custom_app_bar.dart';
import 'package:haiporo/constants/size_constant.dart';
import 'package:haiporo/models/category/word-category.dart';
import 'package:haiporo/screens/category/test/category_test.cubit.dart';

class CategoryTest extends StatefulWidget {
  final WordCategory category;

  CategoryTest(this.category);

  @override
  _CategoryTestState createState() => _CategoryTestState();
}

class _CategoryTestState extends State<CategoryTest> {
  CategoryTestCubit _categoryTestCubit;

  @override
  void initState() {
    super.initState();
    _categoryTestCubit = CategoryTestCubit(widget.category.id);
  }

  @override
  void dispose() {
    super.dispose();
    _categoryTestCubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        title: Text(widget.category.description),
      ),
      body: BlocBuilder<CategoryTestCubit, CategoryTestState>(
        bloc: _categoryTestCubit,
        builder: (context, state) {
          if (_categoryTestCubit.words.length == 0) {
            return Container();
          } else {
            _categoryTestCubit.startTimer(context);
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: SizeConstant.blockSizeHorizontal * 70,
                        child: LinearProgressIndicator(
                          value: _categoryTestCubit.value / 60.0,
                          backgroundColor: Colors.black,
                        ),
                      ),
                      for (int i = 0; i < _categoryTestCubit.heart; i++)
                        Icon(
                          Icons.favorite,
                          color: Theme.of(context).primaryColor,
                        ),
                      for (int i = 0; i < 3 - _categoryTestCubit.heart; i++)
                        Icon(
                          Icons.favorite_border,
                        ),
                    ],
                  ),
                ),
                Text(
                    _categoryTestCubit
                        .words[_categoryTestCubit
                            .questions[_categoryTestCubit.answer]]
                        .word,
                    style: TextStyle(fontSize: 25)),
                Container(
                  height: SizeConstant.screenHeight / 2,
                  child: GridView.count(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    children: [
                      for (int i = 0; i < 4; i++)
                        InkWell(
                          onTap: () {
                            _categoryTestCubit.takeAnswer(context, i);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(1),
                                    spreadRadius: 0,
                                    blurRadius: 5,
                                    offset: Offset(0, 0),
                                  ),
                                ]),
                            child: Center(
                                child: Image(
                              image: AssetImage(
                                  File("assets/images/words/${_categoryTestCubit.words[_categoryTestCubit.questions[i]].word}")
                                              .existsSync() ==
                                          true
                                      ? "assets/images/words/${_categoryTestCubit.words[_categoryTestCubit.questions[i]].word}"
                                      : "assets/images/fallback.png"),
                            )),
                          ),
                        )
                    ],
                  ),
                ),
                Text(
                    "${_categoryTestCubit.current}/${_categoryTestCubit.questionNumber}",
                    style: TextStyle(fontSize: 20)),
              ],
            );
          }
        },
      ),
    );
  }
}
