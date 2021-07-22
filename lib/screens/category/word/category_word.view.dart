import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:haiporo/components/custom_app_bar.dart';
import 'package:haiporo/config/themes/font_family.dart';
import 'package:haiporo/constants/size_constant.dart';
import 'package:haiporo/models/word/word.dart';
import 'package:haiporo/screens/category/word/category_word.cubit.dart';

class CategoryWord extends StatefulWidget {
  final Word word;

  CategoryWord(this.word);

  @override
  _CategoryWordState createState() => _CategoryWordState();
}

class _CategoryWordState extends State<CategoryWord> {
  CategoryWordCubit _categoryWordCubit;

  @override
  void initState() {
    super.initState();
    _categoryWordCubit = CategoryWordCubit(widget.word.id);
  }

  @override
  void dispose() {
    super.dispose();
    _categoryWordCubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        title: Text(widget.word.word),
      ),
      body: Container(
        alignment: AlignmentDirectional.topCenter,
        child: BlocBuilder<CategoryWordCubit, CategoryWordState>(
          bloc: _categoryWordCubit,
          builder: (context, state) => SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Image(
                    image: AssetImage(
                        "assets/images/words/${widget.word.word}.png"),
                  ),
                ),
                Text(
                  widget.word.word,
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.word.pronounce,
                  style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontFamily: CustomFontFamily.openSans,
                  ),
                ),
                IconButton(
                  iconSize: 40,
                  onPressed: () async {
                    _categoryWordCubit.getTTS(widget.word.word);
                  },
                  icon: Icon(Icons.volume_up),
                ),
                Container(
                  child: Html(
                    data: widget.word.html.split("</i></h3>")[1],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
