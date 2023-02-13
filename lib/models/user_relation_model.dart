// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserRelationModel {
  final int id;
  final int user_id;
  final String name;
  final String nric_no;
  final String passport_no;
  final String mobile_no;
  final int relationship_type;
  final String vaccine_type;
  final String nric_img;
  final String passport_img;
  UserRelationModel({
    required this.id,
    required this.user_id,
    required this.name,
    required this.nric_no,
    required this.passport_no,
    required this.mobile_no,
    required this.relationship_type,
    required this.vaccine_type,
    required this.nric_img,
    required this.passport_img,
  });

  UserRelationModel copyWith({
    int? id,
    int? user_id,
    String? name,
    String? nric_no,
    String? passport_no,
    String? mobile_no,
    int? relationship_type,
    String? vaccine_type,
    String? nric_img,
    String? passport_img,
  }) {
    return UserRelationModel(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      name: name ?? this.name,
      nric_no: nric_no ?? this.nric_no,
      passport_no: passport_no ?? this.passport_no,
      mobile_no: mobile_no ?? this.mobile_no,
      relationship_type: relationship_type ?? this.relationship_type,
      vaccine_type: vaccine_type ?? this.vaccine_type,
      nric_img: nric_img ?? this.nric_img,
      passport_img: passport_img ?? this.passport_img,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': user_id,
      'name': name,
      'nric_no': nric_no,
      'passport_no': passport_no,
      'mobile_no': mobile_no,
      'relationship_type': relationship_type,
      'vaccine_type': vaccine_type,
      'nric_img': nric_img,
      'passport_img': passport_img,
    };
  }

  factory UserRelationModel.fromMap(Map<String, dynamic> map) {
    return UserRelationModel(
      id: map['id'] as int,
      user_id: map['user_id'] as int,
      name: map['name'] as String,
      nric_no: map['nric_no'] as String,
      passport_no: map['passport_no'] as String,
      mobile_no: map['mobile_no'] as String,
      relationship_type: map['relationship_type'] as int,
      vaccine_type: map['vaccine_type'] as String,
      nric_img: map['nric_img'] as String,
      passport_img: map['passport_img'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserRelationModel.fromJson(String source) =>
      UserRelationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserRelationModel(id: $id, user_id: $user_id, name: $name, nric_no: $nric_no, passport_no: $passport_no, mobile_no: $mobile_no, relationship_type: $relationship_type, vaccine_type: $vaccine_type, nric_img: $nric_img, passport_img: $passport_img)';
  }

  @override
  bool operator ==(covariant UserRelationModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.user_id == user_id &&
        other.name == name &&
        other.nric_no == nric_no &&
        other.passport_no == passport_no &&
        other.mobile_no == mobile_no &&
        other.relationship_type == relationship_type &&
        other.vaccine_type == vaccine_type &&
        other.nric_img == nric_img &&
        other.passport_img == passport_img;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        user_id.hashCode ^
        name.hashCode ^
        nric_no.hashCode ^
        passport_no.hashCode ^
        mobile_no.hashCode ^
        relationship_type.hashCode ^
        vaccine_type.hashCode ^
        nric_img.hashCode ^
        passport_img.hashCode;
  }
}
