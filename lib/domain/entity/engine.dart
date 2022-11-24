class Engine {
  final int? id;
  final String? name;

  Engine({this.id, this.name});

  factory Engine.fromMap(Map<String, dynamic> json) => Engine(
        id: json['id_engine'],
        name: json['engine_name'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id_engine': id,
      'engine_name': name,
    };
  }
}