import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardTile extends StatelessWidget {
  Widget lead;
  Widget child;

  DashboardTile({this.lead, this.child});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Card(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Theme.of(context).primaryColor,
                child: this.lead,
              ),
            ),
            Expanded(
              flex: 3,
              child: this.child,
            ),
          ],
        ),
      ),
    );
  }
}
