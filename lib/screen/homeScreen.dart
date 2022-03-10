import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:orgamart/controller/shopping_Controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final shoppingController = Get.put(Shopping_controller());
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: Color(
            0xFF32cd32,
          ),

          ///todo- make it const
          title: Text(
            'OrgaMart',
            style: TextStyle(fontSize: 22, wordSpacing: 6),

            ///todo- make responsive
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add_shopping_cart,
                size: 30,

                ///todo- responsive
              ),
            )
          ],
        ),
        drawer: Drawer(
          elevation: 10,
          backgroundColor: Colors.white,

          ///todo- make it const
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              ProductsTile(),
            ],
          ),
        ));
  }
}

class ProductsTile extends StatelessWidget {
  const ProductsTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 20),

      ///todo- responsive
      child: Container(
        height: 250,

        ///todo- responsive
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 8.0,

                ///todo- responsive
                offset: Offset(0, 2)),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),

          ///todo- responsive
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),

                ///todo- responsive
                child: Text(
                  'Products',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Expanded(
                child: GetX<Shopping_controller>(
                  builder: (controller) {
                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),

                          ///todo- responsive
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.black12,
                                      width: 0.1,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 10.0,

                                        ///todo- responsive
                                        offset: Offset(0, 2),
                                      )
                                    ]),
                                child: ClipOval(
                                  child: Image(
                                    image: AssetImage(
                                        controller.products[index].imagePath),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                height: 130,

                                ///todo- responsive
                                width: 130,

                                ///todo- responsive
                              ),

                              ///todo- make responsive
                              SizedBox(
                                height: 10,

                                ///todo- responsive
                              ),
                              Text(
                                controller.products[index].name,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),

                              ///todo- make responsive
                            ],
                          ),
                        );
                      },
                    );
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
