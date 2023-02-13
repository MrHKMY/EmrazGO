// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RelationshipTypeModel {
  final int id;
  final String relationship_type;
  RelationshipTypeModel({
    required this.id,
    required this.relationship_type,
  });

  RelationshipTypeModel copyWith({
    int? id,
    String? relationship_type,
  }) {
    return RelationshipTypeModel(
      id: id ?? this.id,
      relationship_type: relationship_type ?? this.relationship_type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'relationship_type': relationship_type,
    };
  }

  factory RelationshipTypeModel.fromMap(Map<String, dynamic> map) {
    return RelationshipTypeModel(
      id: map['id'] as int,
      relationship_type: map['relationship_type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RelationshipTypeModel.fromJson(String source) =>
      RelationshipTypeModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'RelationshipTypeModel(id: $id, relationship_type: $relationship_type)';

  @override
  bool operator ==(covariant RelationshipTypeModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.relationship_type == relationship_type;
  }

  @override
  int get hashCode => id.hashCode ^ relationship_type.hashCode;
}
