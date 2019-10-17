import 'package:cranios/models/Receipt.dart';

class Transaction {
  int id;
  double value;
  int type;
  List<Receipt> receipts;

  Transaction(this.id, this.value, this.type, this.receipts);

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      json['id'],
      json['value'],
      json['type'],
      (json['receipts'] as List).map((r) => Receipt.fromJson(r)).toList()
    );
  }

  Map<String, dynamic> toJson() => {
    'id': this.id,
    'value': this.value,
    'type': this.type,
    'receipts': this.receipts.map((r) => r.toJson()),
  };
}
