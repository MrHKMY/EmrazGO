// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PackagePaymentModel {
  final int id;
  final int user_id;
  final double amount;
  PackagePaymentModel({
    required this.id,
    required this.user_id,
    required this.amount,
  });

  PackagePaymentModel copyWith({
    int? id,
    int? user_id,
    double? amount,
  }) {
    return PackagePaymentModel(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': user_id,
      'amount': amount,
    };
  }

  factory PackagePaymentModel.fromMap(Map<String, dynamic> map) {
    return PackagePaymentModel(
      id: map['id'] as int,
      user_id: map['user_id'] as int,
      amount: map['amount'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory PackagePaymentModel.fromJson(String source) =>
      PackagePaymentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PackagePaymentModel(id: $id, user_id: $user_id, amount: $amount)';

  @override
  bool operator ==(covariant PackagePaymentModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.user_id == user_id && other.amount == amount;
  }

  @override
  int get hashCode => id.hashCode ^ user_id.hashCode ^ amount.hashCode;
}
