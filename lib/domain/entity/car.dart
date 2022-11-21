class Car {
  final int? id;
  final String? name;
  final String? model;
  final String? power;
  final String? capacity;
  final String? engine_capacity;
  final int? engine_id;
  final int? kuzov_id;
  final int? marka_id;
  final int? diski_id;

  Car(
      {this.id,
      this.name,
      this.model,
      this.power,
      this.capacity,
      this.engine_capacity,
      this.engine_id,
      this.kuzov_id,
      this.marka_id,
      this.diski_id});

  factory Car.fromMap(Map<String, dynamic> json) => Car(
        id: json['id'],
        name: json['name'],
        model: json['model'],
        power: json['power'],
        capacity: json['capacity'],
        engine_capacity: json['engine_capacity'],
        engine_id: json['engine_id'],
        kuzov_id: json['kuzov_id'],
        marka_id: json['marka_id'],
        diski_id: json['diski_id'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'model': model,
      'power': power,
      'capacity': capacity,
      'engine_capacity': engine_capacity,
      'engine_id': engine_id,
      'kuzov_id': kuzov_id,
      'marka_id': marka_id,
      'diski_id': diski_id,
    };
  }
}
