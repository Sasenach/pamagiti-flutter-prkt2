import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../common/data_base_request.dart';
import '../../domain/entity/kuzov.dart';
import 'admin_menu.dart';

class Kuzovs extends StatefulWidget {
  const Kuzovs({super.key});

  @override
  State<Kuzovs> createState() => _KuzovsState();
}

class _KuzovsState extends State<Kuzovs> {
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
                        decoration: InputDecoration(hintText: 'Name of kuzov'),
                        controller: textInput,
                      )),
                  Container(
                      width: double.infinity,
                      height: 400,
                      child: FutureBuilder<List<Kuzov>>(
                        future: DataBaseRequest.getKuzovs(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Kuzov>> snapshot) {
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
                            children: snapshot.data!.map((kuzov) {
                              return Center(
                                child: ListTile(
                                  title: Text(
                                      kuzov.name!), //тут может быть проблемка
                                  onTap: () {
                                    setState(() {
                                      selectedId = kuzov.id!;
                                      textInput.text = kuzov.name!;
                                    });
                                  },
                                  onLongPress: () {
                                    setState(() {
                                      DataBaseRequest.deleteKuzov(kuzov.id!);
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
                ? DataBaseRequest.insertKuzov(Kuzov(name: textInput.text))
                : DataBaseRequest.upadateKuzov(
                    Kuzov(id: selectedId, name: textInput.text));
            setState(() {
              textInput.clear();
              selectedId = null;
            });
          },
        ));
  }
}
