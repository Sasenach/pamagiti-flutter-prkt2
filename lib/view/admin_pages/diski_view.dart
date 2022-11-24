import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../common/data_base_request.dart';
import '../../domain/entity/diski.dart';
import 'admin_menu.dart';

class Diskis extends StatefulWidget {
  const Diskis({super.key});

  @override
  State<Diskis> createState() => _DiskisState();
}

class _DiskisState extends State<Diskis> {
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
                        decoration: InputDecoration(hintText: 'Name of diski'),
                        controller: textInput,
                      )),
                  Container(
                      width: double.infinity,
                      height: 400,
                      child: FutureBuilder<List<Diski>>(
                        future: DataBaseRequest.getDiski(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Diski>> snapshot) {
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
                            children: snapshot.data!.map((diski) {
                              return Center(
                                child: ListTile(
                                  title: Text(
                                      diski.name!), //тут может быть проблемка
                                  onTap: () {
                                    setState(() {
                                      selectedId = diski.id!;
                                      textInput.text = diski.name!;
                                    });
                                  },
                                  onLongPress: () {
                                    setState(() {
                                      DataBaseRequest.deleteDiski(diski.id!);
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
                ? DataBaseRequest.insertDiskis(Diski(name: textInput.text))
                : DataBaseRequest.upadateDiski(
                    Diski(id: selectedId, name: textInput.text));
            setState(() {
              textInput.clear();
              selectedId = null;
            });
          },
        ));
  }
}