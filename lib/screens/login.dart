import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cranios/blocs/login_state.dart';
import 'package:cranios/blocs/login_bloc.dart';
import 'package:cranios/blocs/login_event.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);

    loginBloc.state.listen((LoginState state) {
      switch (state.runtimeType) {
        case LoggedIn:
          Navigator.of(context).pushReplacementNamed('/main');
          break;
        default:
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('Login ou senha inválidos.'),
            ),
          );
          break;
      }
    });

    print('build');

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('Cranios'),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Usuário'),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Senha'),
              ),
              SizedBox(height: 50),
              RaisedButton(
                child: Text('Entrar'),
                onPressed: () {
                  loginBloc.dispatch(Authenticate('', ''));
                },
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(height: 20),
              FlatButton(
                child: Text('Criar conta'),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
