import 'package:flutter/material.dart';
import 'package:customizable_space_bar/customizable_space_bar.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: CupertinoColors.white,
          flexibleSpace: CustomizableSpaceBar(
            builder: (context, scrollingRate) {
              return Padding(
                padding:
                    EdgeInsets.only(bottom: 13, left: 12 + 40 * scrollingRate),
                child: Container(),
              );
            },
          ),
        ),
      ],
    ));
  }
}
