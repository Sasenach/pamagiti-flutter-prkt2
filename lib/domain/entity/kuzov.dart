class Kuzov {
  final int? id;
  final String? name;

  Kuzov({this.id, this.name});

  factory Kuzov.fromMap(Map<String, dynamic> json) => Kuzov(
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