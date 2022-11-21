import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../common/data_base_request.dart';
import '../domain/entity/car.dart';
import 'admin_menu.dart';

class Cars extends StatefulWidget {
  const Cars({super.key});

  @override
  State<Cars> createState() => _CarsState();
}

class _CarsState extends State<Cars> {
  final TextEditingController textName = TextEditingController();
  final TextEditingController textModel = TextEditingController();
  final TextEditingController textPower = TextEditingController();
  final TextEditingController textCapacity = TextEditingController();
  final TextEditingController textEngineCapacity = TextEditingController();
  final TextEditingController textEngineId = TextEditingController();
  final TextEditingController textKuzovId = TextEditingController();
  final TextEditingController textMarkaId = TextEditingController();
  final TextEditingController textDiskiId = TextEditingController();
  int? selectedId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            iconSize: 20.0,
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AdminMenu()));
            },
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: double.infinity,
                        height: 45,
                        child: TextField(
                          decoration: InputDecoration(hintText: 'Name'),
                          controller: textName,
                        )),
                    Container(
                        width: double.infinity,
                        height: 45,
                        child: TextField(
                          decoration: InputDecoration(hintText: 'Model'),
                          controller: textModel,
                        )),
                    Container(
                        width: double.infinity,
                        height: 45,
                        child: TextField(
                          decoration: InputDecoration(hintText: 'Power'),
                          controller: textPower,
                        )),
                    Container(
                        width: double.infinity,
                        height: 45,
                        child: TextField(
                          decoration: InputDecoration(hintText: 'Capacity'),
                          controller: textCapacity,
                        )),
                    Container(
                        width: double.infinity,
                        height: 45,
                        child: TextField(
                          decoration:
                              InputDecoration(hintText: 'Engine capacity'),
                          controller: textEngineCapacity,
                        )),
                    Container(
                        width: double.infinity,
                        height: 45,
                        child: TextField(
                          decoration: InputDecoration(hintText: 'EngineId'),
                          controller: textEngineId,
                        )),
                    Container(
                        width: double.infinity,
                        height: 45,
                        child: TextField(
                          decoration: InputDecoration(hintText: 'KuzovId'),
                          controller: textKuzovId,
                        )),
                    Container(
                        width: double.infinity,
                        height: 45,
                        child: TextField(
                          decoration: InputDecoration(hintText: 'MarkaId'),
                          controller: textMarkaId,
                        )),
                    Container(
                        width: double.infinity,
                        height: 45,
                        child: TextField(
                          decoration: InputDecoration(hintText: 'DiskiId'),
                          controller: textDiskiId,
                        )),
                    Container(
                        width: double.infinity,
                        height: 400,
                        child: FutureBuilder<List<Car>>(
                          future: DataBaseRequest.getCars(),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<Car>> snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                  child: Text(
                                'Loading...',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ));
                            }
                            if (snapshot.data!.isEmpty) {
                              return const Center(
                                  child: Text(
                                'Loading...',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ));
                            }
          
                            return ListView(
                              children: snapshot.data!.map((car) {
                                return Container(
                                  child: ListTile(
                                    title: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Name: ' + car.name!),
                                        Text('Model: ' + car.model!),
                                        Text('Power: ' + car.power!),
                                        Text('Capacity: ' + car.capacity!),
                                        Text('Engine capacity: ' +
                                            car.engine_capacity!),
                                        Text('Engine_id: ' +
                                            car.engine_id!.toString()),
                                        Text('Kuzov_id: ' +
                                            car.kuzov_id!.toString()),
                                        Text('Marka_id: ' +
                                            car.marka_id!.toString()),
                                        Text('Diski_id: ' +
                                            car.diski_id!.toString()),
                                      ],
                                    ),
                                    onTap: () {
                                      setState(() {
                                        selectedId = car.id!;
                                        textName.text = car.name!;
                                        textModel.text = car.model!;
                                        textPower.text = car.power!;
                                        textCapacity.text = car.capacity!;
                                        textEngineCapacity.text = car.engine_capacity!;
                                        textEngineId.text = car.engine_id!.toString();
                                        textKuzovId.text = car.kuzov_id!.toString();
                                        textMarkaId.text = car.marka_id!.toString();
                                        textDiskiId.text = car.diski_id!.toString();
                                      });
                                    },
                                    onLongPress: () {
                                      setState(() {
                                        DataBaseRequest.deleteCar(car.id!);
                                      });
                                    },
                                  ),
                                );
                              }).toList(),
                            );
                          },
                        ))
                  ]),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.save_alt_rounded),
          onPressed: () async {
            await selectedId == null
                ? DataBaseRequest.insertCar(
                    Car(name: textName.text, 
                      model: textModel.text, 
                      power: textPower.text,
                      capacity: textCapacity.text,
                      engine_capacity: textEngineCapacity.text,
                      engine_id: int.parse(textEngineId.text),
                      kuzov_id: int.parse(textKuzovId.text),
                      marka_id: int.parse(textMarkaId.text),
                      diski_id: int.parse(textEngineId.text)))
                : DataBaseRequest.upadateCar(
                    Car(id: selectedId, 
                    name: textName.text, 
                      model: textModel.text, 
                      power: textPower.text,
                      capacity: textCapacity.text,
                      engine_capacity: textEngineCapacity.text,
                      engine_id: int.parse(textEngineId.text),
                      kuzov_id: int.parse(textKuzovId.text),
                      marka_id: int.parse(textMarkaId.text),
                      diski_id: int.parse(textDiskiId.text)));
            setState(() {
              textName.clear();
              textModel.clear();
              textPower.clear();
              textCapacity.clear();
              textEngineCapacity.clear();
              textEngineId.clear();
              textKuzovId.clear();
              textMarkaId.clear();
              textDiskiId.clear();
              selectedId = null;
            });
          },
        ));
  }
}
