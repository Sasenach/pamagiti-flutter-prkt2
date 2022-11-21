import 'package:autocar/view/admin_menu.dart';
import 'package:autocar/view/marka_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:google_fonts/google_fonts.dart';

class LetsGoPage extends StatelessWidget {
  const LetsGoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
            child: Container(             
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/letsgopege_bg.jpeg"),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.only(bottom: 450, right: 25),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/Mercedes-Benz-logo.png") 
                          )
                      ),
                    ),
                    ),
                    
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 25),
                      margin: const EdgeInsets.only(bottom: 10),
                      child: const Text(
                      'Luxury car just\nfor you',
                      style: TextStyle(
                              fontFamily: 'Poppins-Medium',
                              fontSize: 25,
                              color: Colors.white,
                            ),
                    )),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 25),
                      margin: const EdgeInsets.only(bottom: 75),
                      child: const Text(
                      'Buy the latest model cars',
                      style: TextStyle(
                              fontFamily: 'Poppins-Medium',
                              fontSize: 13,
                              color: Colors.white,
                            ),
                    )),
                    Container(
                        width: 200,
                        height: 60,
                        margin: const EdgeInsets.only(bottom: 30),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => const AdminMenu()));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(122, 255, 255, 255),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          child: const Text(
                            'Let’s Go!',
                            style: TextStyle(
                              fontFamily: 'Poppins-Medium',
                              fontSize: 20,
                              color: Colors.black,
                            )
                          ),
                        ))
                  ],
                ))),
    );
  }
}
