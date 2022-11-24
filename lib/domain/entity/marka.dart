class Marka {
  final int? id;
  final String? name;

  Marka({this.id, this.name});

  factory Marka.fromMap(Map<String, dynamic> json) => Marka(
        id: json['id_marka'],
        name: json['marka_name'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id_marka': id,
      'marka_name': name,
    };
  }
}