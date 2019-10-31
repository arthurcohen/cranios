import 'dart:ffi';

import 'package:cranios/blocs/login_bloc.dart';
import 'package:cranios/components/dashboard/dashboard_tile.dart';
import 'package:cranios/components/dashboard/welcome_user.dart';
import 'package:cranios/components/menu.dart';
import 'package:cranios/models/User.dart';
import 'package:cranios/screens/dashboard/transaction_new.dart';
import 'package:cranios/screens/dashboard/transactions_list.dart';
import 'package:cranios/screens/news/news-list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);

    final User user = loginBloc.currentState.user;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          title: Text('Cranios'),
          bottom: TabBar(
            tabs: [
              Icon(Icons.home),
              Icon(Icons.insert_chart),
              Icon(Icons.add),
              Stack(
                children: <Widget>[
                  Icon(Icons.directions_run),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: user.lastTimeReadNotifications.compareTo(DateTime.now()) <= 0 ? ClipOval(
                      child: Container(
                        height: 10,
                        width: 10,
                        color: Colors.red,
                      ),
                    ) : Container(),
                  )
                ],
              )
              // Icon(Icons.settings)
              // video_library
              // directions_run
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  WelcomeUser(user),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: <Widget>[
                        DashboardTile(
                          lead: Icon(Icons.receipt),
                          child: Row(
                            children: <Widget>[
                              Text('Você tem '),
                              Text(
                                '${user.transactions.length}',
                                style: TextStyle(fontSize: 25),
                              ),
                              Text(' contribuições!'),
                            ],
                          ),
                        ),
                        DashboardTile(
                          lead: Icon(Icons.attach_money),
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
                              ),
                            ],
                          ),
                        ),
                        DashboardTile(
                          lead: Icon(Icons.insert_chart),
                          child: Row(
                            children: <Widget>[
                              Text('Taxa de rendimento '),
                              Text('${user.participation}%')
                            ],
                          ),
                        ),
                        DashboardTile(
                          lead: Icon(Icons.insert_chart),
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
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                      onPressed: () {},
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            TransactionsList(),
            TransactionNew(),
            NewsList(),
          ],
        ),
      ),
    );
  }
}
