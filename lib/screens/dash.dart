import 'package:cranios/components/menu.dart';
import 'package:flutter/material.dart';

class Dash extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        title: Text('Cranios'),
      ),
      body: Column(
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
                      Text('Bem vindo, Arthur!'),
                      Text('Você tem 5 contribuições!')
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text('Rendimento atual'),
                Row(
                  children: <Widget>[
                    Text('R\$'),
                    Text('120,60')
                  ],
                )
              ],
            ),
          ),
          Container(
            color: Colors.blue,
            child: Row(
              children: <Widget>[
                Text('Taxa de rendimento'),
                Text('5%')
              ],
            ),
          )
        ],
      ),
    );
  }
}
