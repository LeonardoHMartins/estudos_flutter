// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class People {
  final String name;
  final String birth_year;
  final String gender;
  People({
    required this.name,
    required this.birth_year,
    required this.gender,
  });

  People copyWith({
    String? name,
    String? birth_year,
    String? gender,
  }) {
    return People(
      name: name ?? this.name,
      birth_year: birth_year ?? this.birth_year,
      gender: gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'birth_year': birth_year,
      'gender': gender,
    };
  }

  factory People.fromMap(Map<String, dynamic> map) {
    return People(
      name: map['name'] as String,
      birth_year: map['birth_year'] as String,
      gender: map['gender'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory People.fromJson(String source) =>
      People.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'People(name: $name, birth_year: $birth_year, gender: $gender)';

  @override
  bool operator ==(covariant People other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.birth_year == birth_year &&
        other.gender == gender;
  }

  @override
  int get hashCode => name.hashCode ^ birth_year.hashCode ^ gender.hashCode;
}
