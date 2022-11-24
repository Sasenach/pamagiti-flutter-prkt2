class Diski {
  final int? id;
  final String? name;

  Diski({this.id, this.name});

  factory Diski.fromMap(Map<String, dynamic> json) => Diski(
        id: json['id_diski'],
        name: json['diski_name'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id_diski': id,
      'diski_name': name,
    };
  }
}
