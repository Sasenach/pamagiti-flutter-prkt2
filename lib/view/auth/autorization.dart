import 'package:autocar/common/data_base_request.dart';
import 'package:autocar/domain/entity/customer.dart';
import 'package:autocar/view/admin_pages/admin_menu.dart';
import 'package:autocar/view/auth/registration.dart';
import 'package:autocar/view/user_pages/car_view_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Autorization extends StatefulWidget {
  const Autorization({super.key});

  @override
  State<Autorization> createState() => _AutorizationState();
}

class _AutorizationState extends State<Autorization> {
  bool _obscure = true;
  TextEditingController login = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 150),
              constraints: const BoxConstraints(
                maxWidth: 600,
              ),
              width: double.infinity,
              height: 65,
              child: Expanded(
                child: TextFormField(
                  autocorrect: false,
                  controller: login,
                  decoration: const InputDecoration(
                    hintText: "Enter Login Here",
                    labelText: "Login",
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),
            ),
            Container(
              constraints: const BoxConstraints(
                maxWidth: 600,
              ),
              width: double.infinity,
              height: 65,
              child: Expanded(
                child: TextField(
                  controller: password,
                  obscureText: _obscure,
                  decoration: InputDecoration(
                      hintText: "Enter Password Here",
                      labelText: "Password",
                      suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscure = !_obscure;
                            });
                          },
                          icon: Icon(_obscure == true
                              ? Icons.visibility
                              : Icons.visibility_off))),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                child: const Center(
                    child: Text(
                  'Sign In',
                  style: TextStyle(fontSize: 24),
                )),
                onPressed: () async {
                  Customer user = await DataBaseRequest.getCustomer(login.text);
                  if (user.password == password.text && user.role_id == 2) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>  CarViewPage(customer: user,)));
                  }
                  else if(user.password == password.text && user.role_id == 1) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AdminMenu()));
                  }

                  // : (BuildContext context) {
                  //     // set up the button
                  //     Widget okButton = TextButton(
                  //       child: Text("OK"),
                  //       onPressed: () {},
                  //     );

                  //     // set up the AlertDialog
                  //     AlertDialog alert = AlertDialog(
                  //       title: const Text("Error"),
                  //       content: const Text("Encorect login or password"),
                  //       actions: [
                  //         okButton,
                  //       ],
                  //     );

                  //     // show the dialog
                  //     showDialog(
                  //       context: context,
                  //       builder: (BuildContext context) {
                  //         return alert;
                  //       },
                  //     );
                  //   };
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: Center(
                child: GestureDetector(
                  onTap: (() {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Registration(),
                    ));
                  }),
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
