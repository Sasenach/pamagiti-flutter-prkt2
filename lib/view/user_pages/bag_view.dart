import 'package:autocar/domain/entity/car_in_bag.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../common/data_base_request.dart';
import '../../domain/entity/car.dart';
import '../../domain/entity/customer.dart';
import 'car_view_page.dart';

class BagView extends StatefulWidget {

  Customer customer;
  BagView({super.key, required this.customer});

  @override
  State<BagView> createState() => _BagViewState(customer);
}


class _BagViewState extends State<BagView> {
  int _selectedindex = 0;
  Customer customer;
  _BagViewState(this.customer);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height - 57;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted_rounded), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: ''),
        ],
        currentIndex: 1,
        onTap: (value) {
          setState(() {
            if (value != 1) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CarViewPage(customer: customer)));
            }
          });
        },
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: _height,
              child: FutureBuilder<List<Car>>(
                  future: DataBaseRequest.getCarsInBag(CarInBag(customer_id: customer.id)),
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
                        return ListTile(
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 325,
                                height: 235,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(car.car_image!),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: 325,
                                      height: 60,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              bottomRight:
                                                  Radius.circular(20)),
                                          color: Color(0xff777777)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    top: 5, left: 20),
                                                child: Text(
                                                  '${car.marka_id!.name.toString()} ${car.model}',
                                                  style: const TextStyle(
                                                    fontFamily:
                                                        'Poppins-Medium',
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w900,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    bottom: 5, left: 20),
                                                child: Text(
                                                  '${car.car_price!.toString()}₽',
                                                  style: const TextStyle(
                                                    fontFamily:
                                                        'Poppins-Medium',
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w100,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: Container(),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                right: 15),
                                            width: 100,
                                            height: 40,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color(0xff000000),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10),
                                                ),
                                              ),
                                              child: const Text(
                                                'Delete from bag',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              onPressed: () {
                                                //todo
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}