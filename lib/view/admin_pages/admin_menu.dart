import 'package:autocar/core/db/data_base_helper.dart';
import 'package:autocar/view/admin_pages/car_view.dart';
import 'package:autocar/view/admin_pages/diski_view.dart';
import 'package:autocar/view/admin_pages/engine_view.dart';
import 'package:autocar/view/admin_pages/kuzov_view.dart';
import 'package:autocar/view/admin_pages/marka_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../common/data_base_request.dart';

class AdminMenu extends StatelessWidget {
  const AdminMenu({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textQuery = TextEditingController();
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
            child: Column(
          children: [
            Container(
              child: TextField(
                decoration: const InputDecoration(hintText: 'Query exequtor field'),
                onEditingComplete: () {
                DataBaseHelper.devHelp(textQuery.text);
            },
          controller: textQuery,
        ),
            ),
            Container(
              width: double.infinity,
              height: 60,
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffebebeb),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    )),
                child: const Center(
                  child: Text(
                    'Mark',
                    style: TextStyle(
                      fontFamily: 'Poppins-Medium',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Markas()));
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 60,
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffebebeb),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    )),
                child: const Center(
                  child: Text(
                    'Kuzov',
                    style: TextStyle(
                      fontFamily: 'Poppins-Medium',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Kuzovs()));
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 60,
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffebebeb),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    )),
                child: const Center(
                  child: Text(
                    'Disks',
                    style: TextStyle(
                      fontFamily: 'Poppins-Medium',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Diskis()));
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 60,
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffebebeb),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    )),
                child: const Center(
                  child: Text(
                    'Engine',
                    style: TextStyle(
                      fontFamily: 'Poppins-Medium',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                onPressed: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Engines()));
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 60,
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffebebeb),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    )),
                child: const Center(
                  child: Text(
                    'Car',
                    style: TextStyle(
                      fontFamily: 'Poppins-Medium',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                onPressed: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Cars()));
                },
              ),
            )
          ],
        )),
      )),
    );
  }
}
