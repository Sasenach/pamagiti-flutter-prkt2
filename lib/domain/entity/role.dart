class Role {
  late int id;
  final String name;

  Role({
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {'name': name};
  }

  factory Role.toFromMap(Map<String, dynamic> json) {
    return Role(name: json['name']);
  }
}

enum RoleEnum { admin, user }
