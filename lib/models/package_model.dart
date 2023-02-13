// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PackageModel {
  final int id;
  final String package_group;
  final String package_type;
  final String package_name;
  final DateTime trave_date;
  final String available_package;
  final DateTime start_date_package;
  final DateTime end_date_package;
  final double package_price;
  final double discount;

  PackageModel({
    required this.id,
    required this.package_group,
    required this.package_type,
    required this.package_name,
    required this.trave_date,
    required this.available_package,
    required this.start_date_package,
    required this.end_date_package,
    required this.package_price,
    required this.discount,
  });

  PackageModel copyWith({
    int? id,
    String? package_group,
    String? package_type,
    String? package_name,
    DateTime? trave_date,
    String? available_package,
    DateTime? start_date_package,
    DateTime? end_date_package,
    double? package_price,
    double? discount,
  }) {
    return PackageModel(
      id: id ?? this.id,
      package_group: package_group ?? this.package_group,
      package_type: package_type ?? this.package_type,
      package_name: package_name ?? this.package_name,
      trave_date: trave_date ?? this.trave_date,
      available_package: available_package ?? this.available_package,
      start_date_package: start_date_package ?? this.start_date_package,
      end_date_package: end_date_package ?? this.end_date_package,
      package_price: package_price ?? this.package_price,
      discount: discount ?? this.discount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'package_group': package_group,
      'package_type': package_type,
      'package_name': package_name,
      'trave_date': trave_date.millisecondsSinceEpoch,
      'available_package': available_package,
      'start_date_package': start_date_package.millisecondsSinceEpoch,
      'end_date_package': end_date_package.millisecondsSinceEpoch,
      'package_price': package_price,
      'discount': discount,
    };
  }

  factory PackageModel.fromMap(Map<String, dynamic> map) {
    return PackageModel(
      id: map['id'] as int,
      package_group: map['package_group'] as String,
      package_type: map['package_type'] as String,
      package_name: map['package_name'] as String,
      trave_date: DateTime.fromMillisecondsSinceEpoch(map['trave_date'] as int),
      available_package: map['available_package'] as String,
      start_date_package:
          DateTime.fromMillisecondsSinceEpoch(map['start_date_package'] as int),
      end_date_package:
          DateTime.fromMillisecondsSinceEpoch(map['end_date_package'] as int),
      package_price: map['package_price'] as double,
      discount: map['discount'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory PackageModel.fromJson(String source) =>
      PackageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PackageModel(id: $id, package_group: $package_group, package_type: $package_type, package_name: $package_name, trave_date: $trave_date, available_package: $available_package, start_date_package: $start_date_package, end_date_package: $end_date_package, package_price: $package_price, discount: $discount)';
  }

  @override
  bool operator ==(covariant PackageModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.package_group == package_group &&
        other.package_type == package_type &&
        other.package_name == package_name &&
        other.trave_date == trave_date &&
        other.available_package == available_package &&
        other.start_date_package == start_date_package &&
        other.end_date_package == end_date_package &&
        other.package_price == package_price &&
        other.discount == discount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        package_group.hashCode ^
        package_type.hashCode ^
        package_name.hashCode ^
        trave_date.hashCode ^
        available_package.hashCode ^
        start_date_package.hashCode ^
        end_date_package.hashCode ^
        package_price.hashCode ^
        discount.hashCode;
  }
}
