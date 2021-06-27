import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:haiporo/screens/app.cubit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app.module.dart';
import '../home.module.dart';

class Setting extends StatefulWidget {
  const Setting({Key key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  AppCubit _appCubit = AppCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
        bloc: _appCubit,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Settings"),
              centerTitle: true,
            ),
            body: ListView(
              children: [
                FutureBuilder(
                  future: _appCubit.getThemeSetting(),
                  builder: (context, snapshot) {
                    return SwitchListTile(
                      value: _appCubit.dark,
                      onChanged: (dark) {
                        _appCubit.setThemeSetting(dark);
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text("Change theme!"),
                            content: Text(
                                "Theme will be changed after restart the app"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Modular.to.pop();
                                },
                                child: Text("Ok"),
                              ),
                            ],
                          ),
                        );
                      },
                      title: Text("Dark theme"),
                    );
                  },
                ),
                ListTile(
                  title: Text("Version: ${"1.0.0"}"),
                ),
                ListTile(
                  title: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1.color),
                          text:
                              'Thanks for using this app. Contact admin via: ',
                        ),
                        TextSpan(
                          text: 'Facebook',
                          style:
                              TextStyle(color: Theme.of(context).accentColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch('https://www.facebook.com/uaena.171100');
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
