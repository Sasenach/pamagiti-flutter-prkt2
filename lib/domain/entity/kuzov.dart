class Kuzov {
  final int? id;
  final String? name;

  Kuzov({this.id, this.name});

  factory Kuzov.fromMap(Map<String, dynamic> json) => Kuzov(
        id: json['id_kuzod'],
        name: json['kuzov_name'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id_kuzov': id,
      'kuzov_name': name,
    };
  }
}