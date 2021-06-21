import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:haiporo/constants/size_constant.dart';
import 'package:haiporo/models/category/word-category.dart';
import 'package:haiporo/screens/app.module.dart';
import 'package:haiporo/screens/category/category.module.dart';

class CategoryCard extends StatefulWidget {
  final WordCategory category;
  final double progress;

  CategoryCard(this.category, this.progress);

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConstant.safeBlockVertical * 50,
      width: SizeConstant.safeBlockHorizontal * 60,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(1),
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(5, 5),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            maxRadius: SizeConstant.safeBlockVertical * 10,
            child: Image(
              image: AssetImage(
                  File("assets/images/categories/${widget.category.name}.png")
                              .existsSync() ==
                          true
                      ? "assets/images/categories/${widget.category.name}.png"
                      : "assets/images/fallback.png"),
            ),
          ),
          SizedBox(
            height: SizeConstant.safeBlockHorizontal * 2,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConstant.safeBlockHorizontal * 15,
            ),
            child: LinearProgressIndicator(
              value: widget.progress,
              minHeight: 10,
            ),
          ),
          Text(
            widget.category.name,
            style: TextStyle(
                fontSize: SizeConstant.safeBlockHorizontal * 6,
                fontWeight: FontWeight.bold),
          ),
          Text(
            widget.category.description,
            style: TextStyle(fontSize: SizeConstant.safeBlockHorizontal * 5.5),
          ),
          ElevatedButton(
            child: Text("Detail"),
            onPressed: () => Modular.to.pushNamed(
                AppModule.category + CategoryModule.list,
                arguments: widget.category),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
          ElevatedButton(
            child: Text("Test"),
            onPressed: () => Modular.to.pushNamed(
                AppModule.category + CategoryModule.test,
                arguments: widget.category),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
