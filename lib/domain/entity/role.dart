class Role {
  late int id;
  final String role;

  Role({
    required this.role,
  });

  Map<String, dynamic> toMap() {
    return {'role': role};
  }

  factory Role.toFromMap(Map<String, dynamic> json) {
    return Role(role: json['role']);
  }
}

enum RoleEnum { admin, user }
