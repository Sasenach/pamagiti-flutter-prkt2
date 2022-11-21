class Engine {
  final int? id;
  final String? name;

  Engine({this.id, this.name});

  factory Engine.fromMap(Map<String, dynamic> json) => Engine(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}