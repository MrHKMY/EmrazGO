// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final int id;
  final String fullname;
  final String nric_no;
  final String passport_no;
  final String email;
  final String address;
  final String poscode;
  final String city;
  final String state;
  final String country;
  final String mobile_no;
  final String vaccine_type;
  final String emergency_contact_person;
  final String emergency_contact_no;
  final String emergency_contact_relation;
  final int activate;
  final String nric_img;
  final String passport_img;
  final String user_push_token;
  final String user_device_type;
  final DateTime created_date;
  final DateTime lastupdate_date;

  UserModel(
    this.id,
    this.fullname,
    this.nric_no,
    this.passport_no,
    this.email,
    this.address,
    this.poscode,
    this.city,
    this.state,
    this.country,
    this.mobile_no,
    this.vaccine_type,
    this.emergency_contact_person,
    this.emergency_contact_no,
    this.emergency_contact_relation,
    this.activate,
    this.nric_img,
    this.passport_img,
    this.user_push_token,
    this.user_device_type,
    this.created_date,
    this.lastupdate_date,
  );

  UserModel copyWith({
    int? id,
    String? fullname,
    String? nric_no,
    String? passport_no,
    String? email,
    String? address,
    String? poscode,
    String? city,
    String? state,
    String? country,
    String? mobile_no,
    String? vaccine_type,
    String? emergency_contact_person,
    String? emergency_contact_no,
    String? emergency_contact_relation,
    int? activate,
    String? nric_img,
    String? passport_img,
    String? user_push_token,
    String? user_device_type,
    DateTime? created_date,
    DateTime? lastupdate_date,
  }) {
    return UserModel(
      id ?? this.id,
      fullname ?? this.fullname,
      nric_no ?? this.nric_no,
      passport_no ?? this.passport_no,
      email ?? this.email,
      address ?? this.address,
      poscode ?? this.poscode,
      city ?? this.city,
      state ?? this.state,
      country ?? this.country,
      mobile_no ?? this.mobile_no,
      vaccine_type ?? this.vaccine_type,
      emergency_contact_person ?? this.emergency_contact_person,
      emergency_contact_no ?? this.emergency_contact_no,
      emergency_contact_relation ?? this.emergency_contact_relation,
      activate ?? this.activate,
      nric_img ?? this.nric_img,
      passport_img ?? this.passport_img,
      user_push_token ?? this.user_push_token,
      user_device_type ?? this.user_device_type,
      created_date ?? this.created_date,
      lastupdate_date ?? this.lastupdate_date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fullname': fullname,
      'nric_no': nric_no,
      'passport_no': passport_no,
      'email': email,
      'address': address,
      'poscode': poscode,
      'city': city,
      'state': state,
      'country': country,
      'mobile_no': mobile_no,
      'vaccine_type': vaccine_type,
      'emergency_contact_person': emergency_contact_person,
      'emergency_contact_no': emergency_contact_no,
      'emergency_contact_relation': emergency_contact_relation,
      'activate': activate,
      'nric_img': nric_img,
      'passport_img': passport_img,
      'user_push_token': user_push_token,
      'user_device_type': user_device_type,
      'created_date': created_date.millisecondsSinceEpoch,
      'lastupdate_date': lastupdate_date.millisecondsSinceEpoch,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['id'] as int,
      map['fullname'] as String,
      map['nric_no'] as String,
      map['passport_no'] as String,
      map['email'] as String,
      map['address'] as String,
      map['poscode'] as String,
      map['city'] as String,
      map['state'] as String,
      map['country'] as String,
      map['mobile_no'] as String,
      map['vaccine_type'] as String,
      map['emergency_contact_person'] as String,
      map['emergency_contact_no'] as String,
      map['emergency_contact_relation'] as String,
      map['activate'] as int,
      map['nric_img'] as String,
      map['passport_img'] as String,
      map['user_push_token'] as String,
      map['user_device_type'] as String,
      DateTime.fromMillisecondsSinceEpoch(map['created_date'] as int),
      DateTime.fromMillisecondsSinceEpoch(map['lastupdate_date'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, fullname: $fullname, nric_no: $nric_no, passport_no: $passport_no, email: $email, address: $address, poscode: $poscode, city: $city, state: $state, country: $country, mobile_no: $mobile_no, vaccine_type: $vaccine_type, emergency_contact_person: $emergency_contact_person, emergency_contact_no: $emergency_contact_no, emergency_contact_relation: $emergency_contact_relation, activate: $activate, nric_img: $nric_img, passport_img: $passport_img, user_push_token: $user_push_token, user_device_type: $user_device_type, created_date: $created_date, lastupdate_date: $lastupdate_date)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.fullname == fullname &&
        other.nric_no == nric_no &&
        other.passport_no == passport_no &&
        other.email == email &&
        other.address == address &&
        other.poscode == poscode &&
        other.city == city &&
        other.state == state &&
        other.country == country &&
        other.mobile_no == mobile_no &&
        other.vaccine_type == vaccine_type &&
        other.emergency_contact_person == emergency_contact_person &&
        other.emergency_contact_no == emergency_contact_no &&
        other.emergency_contact_relation == emergency_contact_relation &&
        other.activate == activate &&
        other.nric_img == nric_img &&
        other.passport_img == passport_img &&
        other.user_push_token == user_push_token &&
        other.user_device_type == user_device_type &&
        other.created_date == created_date &&
        other.lastupdate_date == lastupdate_date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        fullname.hashCode ^
        nric_no.hashCode ^
        passport_no.hashCode ^
        email.hashCode ^
        address.hashCode ^
        poscode.hashCode ^
        city.hashCode ^
        state.hashCode ^
        country.hashCode ^
        mobile_no.hashCode ^
        vaccine_type.hashCode ^
        emergency_contact_person.hashCode ^
        emergency_contact_no.hashCode ^
        emergency_contact_relation.hashCode ^
        activate.hashCode ^
        nric_img.hashCode ^
        passport_img.hashCode ^
        user_push_token.hashCode ^
        user_device_type.hashCode ^
        created_date.hashCode ^
        lastupdate_date.hashCode;
  }
}
