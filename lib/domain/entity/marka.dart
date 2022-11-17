class Marka {
  final int? id;
  final String? name;

  Marka({this.id, this.name});

  factory Marka.fromMap(Map<String, dynamic> json) => Marka(
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