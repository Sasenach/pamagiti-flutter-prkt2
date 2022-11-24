import 'package:autocar/common/data_base_request.dart';
import 'package:autocar/core/db/data_base_helper.dart';
import 'package:autocar/domain/entity/marka.dart';
import 'package:autocar/view/admin_pages/admin_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sqflite/sqflite.dart';

class Markas extends StatefulWidget {
  const Markas({super.key});

  @override
  State<Markas> createState() => _MarkasState();
}

class _MarkasState extends State<Markas> {
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
                        decoration: InputDecoration(hintText: 'Name of marka'),
                        controller: textInput,
                      )),
                  Container(
                      width: double.infinity,
                      height: 400,
                      child: FutureBuilder<List<Marka>>(
                        future: DataBaseRequest.getMarkas(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Marka>> snapshot) {
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
                            children: snapshot.data!.map((marka) {
                              return Center(
                                child: ListTile(
                                  title: Text(
                                      marka.name!), //тут может быть проблемка
                                  onTap: () {
                                    setState(() {
                                      selectedId = marka.id!;
                                      textInput.text = marka.name!;
                                    });
                                  },
                                  onLongPress: () {
                                    setState(() {
                                      DataBaseRequest.deleteMarka(marka.id!);
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
                ? DataBaseRequest.insertMarka(Marka(name: textInput.text))
                : DataBaseRequest.upadateMarka(
                    Marka(id: selectedId, name: textInput.text));
            setState(() {
              textInput.clear();
              selectedId = null;
            });
          },
        ));
  }
}
