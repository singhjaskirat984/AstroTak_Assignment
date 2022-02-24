import 'package:astrotak_assignment/providers/ask_question_provider.dart';
import 'package:astrotak_assignment/screens/ask_a_question_screen.dart';
import 'package:astrotak_assignment/utilities/constants.dart';
import 'package:astrotak_assignment/utilities/navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AskQuestionProvider(),)
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      primarySwatch: Colors.orange,
      appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.orange),
      ),
      iconTheme: const IconThemeData(color: Colors.orange, size: 25),
      primaryTextTheme: const TextTheme(
        headline6: TextStyle(color: kTextColor, fontWeight: FontWeight.w400),
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.w500,
          color: kTextColor,
        ),
        subtitle1: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
          color: kTextColor,
        ),
        bodyText1: TextStyle(
          fontSize: 17.0,
          color: kTextColor,
        ),
        button: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
          color: kTextColor,
        ),
      ),
    ),
      initialRoute: AskQuestionScreen.id,
      onGenerateRoute: (settings) {
        print(
            'Navigation to ${settings.name} arguments: ${settings.arguments}');
        return Navigation.navigateToScreen(
            screenId: settings.name, settings: settings);
      },
    );
  }
}
