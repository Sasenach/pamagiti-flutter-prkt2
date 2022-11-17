class Diski {
  final int? id;
  final String? name;

  Diski({this.id, this.name});

  factory Diski.fromMap(Map<String, dynamic> json) => Diski(
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
