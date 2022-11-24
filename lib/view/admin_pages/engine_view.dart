import 'package:autocar/domain/entity/engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../common/data_base_request.dart';
import 'admin_menu.dart';

class Engines extends StatefulWidget {
  const Engines({super.key});

  @override
  State<Engines> createState() => _EnginesState();
}

class _EnginesState extends State<Engines> {
  final TextEditingController textInput = TextEditingController();
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
          child: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: double.infinity,
                      height: 60,
                      child: TextField(
                        decoration: InputDecoration(hintText: 'Type of engine'),
                        controller: textInput,
                      )),
                  Container(
                      width: double.infinity,
                      height: 400,
                      child: FutureBuilder<List<Engine>>(
                        future: DataBaseRequest.getEngine(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Engine>> snapshot) {
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
                            children: snapshot.data!.map((engine) {
                              return Center(
                                child: ListTile(
                                  title: Text(
                                      engine.name!), //тут может быть проблемка
                                  onTap: () {
                                    setState(() {
                                      selectedId = engine.id!;
                                      textInput.text = engine.name!;
                                    });
                                  },
                                  onLongPress: () {
                                    setState(() {
                                      DataBaseRequest.deleteEngine(engine.id!);
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
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.save_alt_rounded),
          onPressed: () async {
            await selectedId == null
                ? DataBaseRequest.insertEngine(Engine(name: textInput.text))
                : DataBaseRequest.upadateEngine(
                    Engine(id: selectedId, name: textInput.text));
            setState(() {
              textInput.clear();
              selectedId = null;
            });
          },
        ));
  }
}