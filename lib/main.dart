import 'package:cranios/blocs/login_bloc.dart';
import 'package:cranios/screens/dashboard/dashboard.dart';
import 'package:cranios/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  final primaryColor = Color(0xff3694eb);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          builder: (context) => LoginBloc(),
        )
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => Login(),
          '/main': (context) => Dashboard(),
        },
        theme: Theme.of(context).copyWith(
          primaryColor: primaryColor,
          appBarTheme: AppBarTheme.of(context).copyWith(color: primaryColor),
          textTheme: Theme.of(context).textTheme.copyWith(),
          buttonTheme: Theme.of(context).buttonTheme.copyWith(textTheme: ButtonTextTheme.normal)
        ),
      ),
    );
  }
}
