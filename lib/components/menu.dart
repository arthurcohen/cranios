import 'package:flutter/material.dart';

class Menu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text('Cranios'),
          ),
          ListTile(
            title: Text('Menu'),
          ),
          ListTile(
            title: Text('Relatórios'),
          ),
          ListTile(
            title: Text('Contribuir'),
          ),
          ListTile(
            title: Text('Sair'),
          )
        ],
      ),
    );
  }
}
