import 'package:cranios/components/menu.dart';
import 'package:cranios/models/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../blocs/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);

    final User user = loginBloc.currentState.user;

    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        title: Text('Cranios'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text('A'),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Bem vindo, ${user.name}!'),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    height: 100,
                    child: Card(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: CircleAvatar(
                              child: Icon(Icons.receipt),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                    'Você tem ${user.transactions.length} contribuições!'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    child: Card(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: CircleAvatar(
                              child: Icon(Icons.attach_money),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text('Rendimento atual '),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'R\$ ',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w100,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    Text(
                                      '${user.accountBalance()}',
                                      style: TextStyle(fontSize: 25),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              child: Card(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: CircleAvatar(
                        child: Icon(Icons.insert_chart),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Taxa de rendimento'),
                          Text('${user.participation}%')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 100,
              child: Card(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: CircleAvatar(
                        child: Icon(Icons.insert_chart),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text('Ultima contribuição '),
                              Text(
                                'R\$',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w100,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              Text(
                                '${user.accountBalance()}',
                                style: TextStyle(fontSize: 25),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              RaisedButton(
                                child: Text('Repetir Contribuição'),
                                onPressed: () {},
                                color: Theme.of(context).primaryColor,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
