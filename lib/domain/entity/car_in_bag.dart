class CarInBag {
  final int? id;
  final int? customer_id;
  final int? car_id;

  CarInBag({this.id, this.customer_id, this.car_id});

  factory CarInBag.fromMap(Map<String, dynamic> json) => CarInBag(
        id: json['id_car_in_bag'],
        customer_id: json['customer_id'],
        car_id: json['car_id'],
      );
  
  Map<String, dynamic> toMap() {
    return {
      'id_car_in_bag': id,
      'customer_id': customer_id,
      'car_id': car_id,
    };
  }
}