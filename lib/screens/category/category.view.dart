import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haiporo/components/custom_app_bar.dart';
import 'package:haiporo/constants/size_constant.dart';
import 'package:haiporo/models/theme/word-theme.dart';
import 'package:haiporo/screens/category/category.cubit.dart';
import 'package:haiporo/screens/category/components/category_card.dart';

class Category extends StatefulWidget {
  final WordTheme theme;

  Category(this.theme);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  CategoryCubit _categoryCubit;

  @override
  void initState() {
    super.initState();
    _categoryCubit = CategoryCubit(widget.theme.id);
  }

  @override
  void dispose() {
    super.dispose();
    _categoryCubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
        bloc: _categoryCubit,
        builder: (context, state) {
          return Scaffold(
            appBar: appBar(
              context,
              title: Text(widget.theme.description),
            ),
            body: ListView.separated(
              itemCount: _categoryCubit.cats.length,
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                width: SizeConstant.safeBlockHorizontal * 10,
              ),
              itemBuilder: (BuildContext context, int index) {
                return FutureBuilder(
                    future: _categoryCubit
                        .getCategoryProgress(_categoryCubit.cats[index].id),
                    builder: (BuildContext context, snapshot) =>
                        CategoryCard(_categoryCubit.cats[index], snapshot.data as double));
              },
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(
                vertical: SizeConstant.safeBlockVertical * 25,
                horizontal: SizeConstant.safeBlockHorizontal * 15,
              ),
            ),
          );
        });
  }
}
