import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/cubit/localization_cubit.dart';
import 'package:localization/widget/left_page.dart';
import 'package:localization/widget/side_bar.dart';
import 'localization/localization.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<LocalizationCubit>(
          create: (_) => LocalizationCubit(LocalizationStates.initial())),
    ], child: BlocBuilder<LocalizationCubit, LocalizationStates>(
      builder: (context,state){
        return  MaterialApp(
          locale: state.locale,
          title: 'Flutter Demo',
          localizationsDelegates: const [
            Localization.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('sv', 'SE'),
          ],
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      },
    ),);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List languages = ["Swedish", "English"];
  String lang = "Swedish";

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            DropdownButton(
              value: lang,
              onChanged: (value) {
                setState(() {
                  if (value == 'Swedish') {
                    BlocProvider.of<LocalizationCubit>(context)
                        .changeLanguage('sv', 'SE');
                  } else {
                    BlocProvider.of<LocalizationCubit>(context)
                        .changeLanguage('en', 'US');
                  }
                });
                lang = value.toString();
              },
              items: languages.map((value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
        body: Center(
            child: MultiBlocProvider(
          providers: [
            BlocProvider<LocalizationCubit>(
                create: (_) =>
                    LocalizationCubit(LocalizationStates.initial())),
          ],
          child: Row(
            children: [
              Container(
                color: Colors.teal,
                width: 150,
                height: double.maxFinite,
                child: SideBar(),
              ),
              LeftPage(),
            ],
          ),
        )),
      );
  }
}
