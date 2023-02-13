// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BookingModel {
  final int id;
  final int user_id;
  final int package_id;
  final int quantity;
  final DateTime created_at;
  BookingModel({
    required this.id,
    required this.user_id,
    required this.package_id,
    required this.quantity,
    required this.created_at,
  });

  BookingModel copyWith({
    int? id,
    int? user_id,
    int? package_id,
    int? quantity,
    DateTime? created_at,
  }) {
    return BookingModel(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      package_id: package_id ?? this.package_id,
      quantity: quantity ?? this.quantity,
      created_at: created_at ?? this.created_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': user_id,
      'package_id': package_id,
      'quantity': quantity,
      'created_at': created_at.millisecondsSinceEpoch,
    };
  }

  factory BookingModel.fromMap(Map<String, dynamic> map) {
    return BookingModel(
      id: map['id'] as int,
      user_id: map['user_id'] as int,
      package_id: map['package_id'] as int,
      quantity: map['quantity'] as int,
      created_at: DateTime.fromMillisecondsSinceEpoch(map['created_at'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory BookingModel.fromJson(String source) =>
      BookingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BookingModel(id: $id, user_id: $user_id, package_id: $package_id, quantity: $quantity, created_at: $created_at)';
  }

  @override
  bool operator ==(covariant BookingModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.user_id == user_id &&
        other.package_id == package_id &&
        other.quantity == quantity &&
        other.created_at == created_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        user_id.hashCode ^
        package_id.hashCode ^
        quantity.hashCode ^
        created_at.hashCode;
  }
}
