import 'package:cranios/blocs/login_bloc.dart';
import 'package:cranios/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
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
          '/main': (context) => Center(child: Text('ihu'),)
        },
        theme: Theme.of(context).copyWith(
          primaryColor: Color(0xff3694eb)
        ),
      ),
    );
  }
}
