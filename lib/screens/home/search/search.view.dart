import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:haiporo/constants/size_constant.dart';
import 'package:haiporo/screens/app.module.dart';
import 'package:haiporo/screens/category/category.module.dart';
import 'package:haiporo/screens/home/search/search.cubit.dart';

class Search extends StatefulWidget {
  const Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  SearchCubit _searchCubit = SearchCubit();

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
    return BlocBuilder<SearchCubit, SearchState>(
      bloc: _searchCubit,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: TextField(
              controller: _searchCubit.textEditingController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: 'Search',
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                for (var word in _searchCubit.words)
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
                            bottom: BorderSide(
                                color: Theme.of(context).accentColor),
                          ),
                        ),
                      ),
                      onTap: () => Modular.to.pushNamed(
                          AppModule.category + CategoryModule.word,
                          arguments: word)),
              ],
            ),
          ),
        );
      },
    );
  }
}
