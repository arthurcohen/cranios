import 'dart:ffi';

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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text('Início')),
          BottomNavigationBarItem(
              icon: Icon(Icons.insert_chart), title: Text('Relatórios')),
          BottomNavigationBarItem(
              icon: Icon(Icons.add), title: Text('Contribuir')),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Text('A'),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Bem vindo, ${user.name}!',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Card(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Theme.of(context).primaryColor,
                              child: Icon(Icons.receipt),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Row(
                              children: <Widget>[
                                Text('Você tem '),
                                Text('${user.transactions.length}',
                                    style: TextStyle(fontSize: 25)),
                                Text(' contribuições!'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Card(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Theme.of(context).primaryColor,
                              child: Icon(Icons.attach_money),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Row(
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
                  Expanded(
                    flex: 1,
                    child: Card(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Theme.of(context).primaryColor,
                              child: Icon(Icons.insert_chart),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Row(
                              children: <Widget>[
                                Text('Taxa de rendimento '),
                                Text('${user.participation}%')
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Card(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Theme.of(context).primaryColor,
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
                                      'R\$ ',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w100,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    Text(
                                      '${user.lastTransactionValue()}',
                                      style: TextStyle(fontSize: 25),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(right: 16),
                                      child: FlatButton(
                                        child: Text(
                                          'Repetir Contribuição',
                                          style: TextStyle(color: Theme.of(context).primaryColor),
                                        ),
                                        onPressed: () {},
                                      ),
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
          ],
        ),
      ),
    );
  }
}
