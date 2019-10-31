import 'package:cranios/models/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeUser extends StatelessWidget {
  User _user;

  WelcomeUser(this._user);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CircleAvatar(
            radius: 30,
            backgroundColor: Theme.of(context).primaryColor,
            child: Text(_user.name.substring(0, 1).toUpperCase()),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Bem vindo, ${_user.name}!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
