class User {
  final int id;
  final String name;
  final String email;
  final String gender;
  final String status;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.status,
  });

  User copyWith({
    String? name,
    String? email,
    String? gender,
    String? status,
  }) =>
      User(
        id: id,
        name: name ?? this.name,
        email: email ?? this.email,
        gender: gender ?? this.gender,
        status: status ?? this.status,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        gender: json["gender"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "gender": gender,
        "status": status,
      };
}
