import 'package:covid_info/providers/fetch_home_provider.dart';
import 'package:covid_info/utilities/customColors.dart';
import 'package:covid_info/views/HomeTabarView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CovidInfoProvider(),
          child: const HomeTabBarView(),
        ),
      ],
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: MaterialApp(
            title: 'Covid Info',
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              primaryColor: Colors.green,
              textTheme: TextTheme(
                //black and white
                headline1: const TextStyle(color: Colors.black),
                //white and grey
                headline2: const TextStyle(color: Colors.white),
                headline3: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
              dividerColor: Colors.grey,
              appBarTheme: AppBarTheme(
                elevation: 0,
                centerTitle: true,
                backgroundColor: CustomColor.fromHex("#009688"),
                actionsIconTheme: const IconThemeData(
                  color: Colors.white,
                ),
                iconTheme: const IconThemeData(
                  color: Colors.white,
                ),
              ),
            ),
            home: const HomeTabBarView()),
      ),
    );
  }
}
