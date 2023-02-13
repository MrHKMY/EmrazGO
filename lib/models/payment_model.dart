// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PaymentModel {
  final int id;
  final int user_id;
  final int booking_id;
  final int package_payment_id;
  final String payment_method;
  final String payment_type;
  final double paid_amount;
  final DateTime transaction_time;
  PaymentModel({
    required this.id,
    required this.user_id,
    required this.booking_id,
    required this.package_payment_id,
    required this.payment_method,
    required this.payment_type,
    required this.paid_amount,
    required this.transaction_time,
  });

  PaymentModel copyWith({
    int? id,
    int? user_id,
    int? booking_id,
    int? package_payment_id,
    String? payment_method,
    String? payment_type,
    double? paid_amount,
    DateTime? transaction_time,
  }) {
    return PaymentModel(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      booking_id: booking_id ?? this.booking_id,
      package_payment_id: package_payment_id ?? this.package_payment_id,
      payment_method: payment_method ?? this.payment_method,
      payment_type: payment_type ?? this.payment_type,
      paid_amount: paid_amount ?? this.paid_amount,
      transaction_time: transaction_time ?? this.transaction_time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': user_id,
      'booking_id': booking_id,
      'package_payment_id': package_payment_id,
      'payment_method': payment_method,
      'payment_type': payment_type,
      'paid_amount': paid_amount,
      'transaction_time': transaction_time.millisecondsSinceEpoch,
    };
  }

  factory PaymentModel.fromMap(Map<String, dynamic> map) {
    return PaymentModel(
      id: map['id'] as int,
      user_id: map['user_id'] as int,
      booking_id: map['booking_id'] as int,
      package_payment_id: map['package_payment_id'] as int,
      payment_method: map['payment_method'] as String,
      payment_type: map['payment_type'] as String,
      paid_amount: map['paid_amount'] as double,
      transaction_time:
          DateTime.fromMillisecondsSinceEpoch(map['transaction_time'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentModel.fromJson(String source) =>
      PaymentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PaymentModel(id: $id, user_id: $user_id, booking_id: $booking_id, package_payment_id: $package_payment_id, payment_method: $payment_method, payment_type: $payment_type, paid_amount: $paid_amount, transaction_time: $transaction_time)';
  }

  @override
  bool operator ==(covariant PaymentModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.user_id == user_id &&
        other.booking_id == booking_id &&
        other.package_payment_id == package_payment_id &&
        other.payment_method == payment_method &&
        other.payment_type == payment_type &&
        other.paid_amount == paid_amount &&
        other.transaction_time == transaction_time;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        user_id.hashCode ^
        booking_id.hashCode ^
        package_payment_id.hashCode ^
        payment_method.hashCode ^
        payment_type.hashCode ^
        paid_amount.hashCode ^
        transaction_time.hashCode;
  }
}
