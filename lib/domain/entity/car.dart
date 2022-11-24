import 'package:autocar/domain/entity/engine.dart';
import 'package:autocar/domain/entity/kuzov.dart';
import 'package:autocar/domain/entity/marka.dart';

class Car {
  final int? id;
  final int? car_price;
  final String? car_image;
  final String? model;
  final String? power;
  final String? capacity;
  final String? engine_capacity;
  final Engine? engine_id;
  final int? kuzov_id;
  final Marka? marka_id;
  final int? diski_id;

  Car(
      {this.id,
      this.car_price,
      this.car_image,
      this.model,
      this.power,
      this.capacity,
      this.engine_capacity,
      this.engine_id,
      this.kuzov_id,
      this.marka_id,
      this.diski_id});

  factory Car.fromMap(Map<String, dynamic> json) => Car(
        id: json['id_car'],
        car_price: json['car_price'],
        car_image: json['car_image'],
        model: json['model'],
        power: json['power'],
        capacity: json['capacity'],
        engine_capacity: json['engine_capacity'],
        engine_id: Engine(id: json['id_engine'], name: json['engine_name']),
        kuzov_id: json['kuzov_id'],
        marka_id: Marka(id: json['id_marka'], name: json['marka_name']),
        diski_id: json['diski_id'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id_car': id,
      'car_price': car_price,
      'car_image': car_image,
      'model': model,
      'power': power,
      'capacity': capacity,
      'engine_capacity': engine_capacity,
      'engine_id': engine_id!.id,
      'kuzov_id': kuzov_id,
      'marka_id': marka_id!.id,
      'diski_id': diski_id,
    };
  }
}
