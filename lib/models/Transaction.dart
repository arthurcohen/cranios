import 'package:cranios/models/Receipt.dart';

class Transaction {
  int id;
  double value;
  int type;
  Receipt receipt;

  Transaction(this.id, this.value, this.type, this.receipt);

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      json['id'],
      json['value'].toDouble(),
      json['type'],
      Receipt.fromJson(json['receipt']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'value': this.value,
        'type': this.type,
        'receipts': this.receipt.toJson(),
      };
}
