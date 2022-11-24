import 'package:autocar/common/data_base_request.dart';
import 'package:autocar/domain/entity/customer.dart';
import 'package:autocar/view/auth/autorization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  bool _obscure = true;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController login = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 65,
                constraints: const BoxConstraints(maxWidth: 600),
                margin: const EdgeInsets.only(top: 150),
                child: Expanded(
                  child: TextFormField(
                    autocorrect: false,
                    controller: name,
                    decoration: const InputDecoration(
                      hintText: "Enter your name here",
                      labelText: "Name",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 65,
                constraints: const BoxConstraints(maxWidth: 600),
                child: Expanded(
                  child: TextFormField(
                    autocorrect: false,
                    controller: email,
                    decoration: const InputDecoration(
                      hintText: "Enter E-mail here",
                      labelText: "E-mail",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 65,
                constraints: const BoxConstraints(maxWidth: 600),
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
                    'Sign Up',
                    style: TextStyle(fontSize: 24),
                  )),
                  onPressed: () {
                    if (name.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Name field cant be empty'),
                          action: SnackBarAction(
                            label: 'Ok',
                            onPressed: () {},
                          ),
                        ),
                      );
                    } 
                    if (login.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Login field cant be empty'),
                          action: SnackBarAction(
                            label: 'Ok',
                            onPressed: () {},
                          ),
                        ),
                      );
                    } 
                    else if(login.text.length < 6) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Login has to have at least 6 symbols'),
                          action: SnackBarAction(
                            label: 'Ok',
                            onPressed: () {},
                          ),
                        ),
                      );
                    }
                    else if(!RegExp('^(?=.*[a-z])').hasMatch(login.text)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Login can have only latin symbols'),
                          action: SnackBarAction(
                            label: 'Ok',
                            onPressed: () {},
                          ),
                        ),
                      );
                    }
                    if (password.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Password field cant be empty'),
                          action: SnackBarAction(
                            label: 'Ok',
                            onPressed: () {},
                          ),
                        ),
                      );
                    } 
                    else if(password.text.length < 6) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Password has to have at least 6 symbols'),
                          action: SnackBarAction(
                            label: 'Ok',
                            onPressed: () {},
                          ),
                        ),
                      );
                    }
                    else if(!RegExp('^(?=.*[a-z])').hasMatch(password.text)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Password can have only latin symbols'),
                          action: SnackBarAction(
                            label: 'Ok',
                            onPressed: () {},
                          ),
                        ),
                      );
                    }
                    else {
                      DataBaseRequest.insertCustomer(email.text == ''
                          ? Customer(
                              fio: name.text,
                              login: login.text,
                              password: password.text,
                              role_id: 2)
                          : Customer(
                              fio: name.text,
                              email: email.text,
                              login: login.text,
                              password: password.text,
                              role_id: 2));
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Autorization()));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
