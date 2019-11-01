import 'package:cranios/blocs/login/login_bloc.dart';
import 'package:cranios/models/Transaction.dart';
import 'package:cranios/models/TransactionsStatus.dart';
import 'package:cranios/models/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionsList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);
    final User user = loginBloc.currentState.user;

    return ListView.builder(
      itemCount: user.transactions.length,
      itemBuilder: (context, index) {
        Transaction transaction = user.transactions[index];
        Widget transactionStatus;

        switch (TransactionStatus.values[transaction.receipt.status]) {
          case TransactionStatus.APPROVED:
            transactionStatus = Icon(Icons.check_circle, color: Colors.green,);
            break;
          case TransactionStatus.REFUSED:
            transactionStatus = Icon(Icons.close, color: Colors.red,);
            break;
          case TransactionStatus.PENDING:
            transactionStatus = Icon(Icons.timer, color: Colors.yellow,);
            break;
        }

        return ListTile(
          leading: transactionStatus,
          title: Row(
            children: <Widget>[
              Text(transaction.type == 1 ? 'Depósito' : 'Extrato'),
            ],
          ),
          subtitle: Text(
              'R\$ ${transaction.value}'),
          trailing: FlatButton(child: Icon(Icons.filter), onPressed: () {
            // TO-DO: Show transaction Receipt
          }),
        );
      },
    );
  }
}
