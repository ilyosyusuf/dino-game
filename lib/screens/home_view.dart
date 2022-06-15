import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  AnimationController? dinosaurController;
  AnimationController? cactusController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    dinosaurController = AnimationController(
        vsync: this,
        lowerBound: 410,
        upperBound: 490,
        duration: Duration(milliseconds: 700));

    cactusController = AnimationController(
        vsync: this,
        lowerBound: 0,
        upperBound: 460,
        duration: Duration(seconds: 4));
    cactusController!.forward();
    cactusController!.addListener(() {
      debugPrint(cactusController!.value.toString());
      if (dinosaurController!.value > 408.0 &&
          dinosaurController!.value < 450.0 &&
          cactusController!.value > 288.5 &&
          cactusController!.value < 360.0) {
        print("kichik");
        cactusController!.stop();
        dinosaurController!.stop();
        showDialog(
            useRootNavigator: false,
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Container(
                  color: Colors.white,
                  child: Center(
                    child: Text("You Lost 😒 Try again?"),
                  ),
                ),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Navigator.pop(context);
                          cactusController!.reset();
                          dinosaurController!.reset();
                          cactusController!.forward();
                        });
                      },
                      child: Text("Yes")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          
                          exit(0);
                        });
                      },
                      child: Text("No"))
                ],
              );
            });
      }
      setState(() {});
    });

    cactusController!.addStatusListener((status) {
      debugPrint("Status: $status");

      if (status == AnimationStatus.completed) {
        cactusController!.repeat();
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          dinosaurController!.forward();
          dinosaurController!.addListener(() {
            debugPrint(dinosaurController!.value.toString());
            setState(() {});
          });

          dinosaurController!.addStatusListener((status) {
            debugPrint("Status: $status");
            if (status == AnimationStatus.completed) {
              dinosaurController!.reverse();
            }
          });

          setState(() {});
        },
        child: Stack(
          children: [
            Center(child: Image.asset('assets/images/ground.gif')),
            Positioned(
              left: 20,
              bottom: dinosaurController!.value,
              child: Image.asset(
                'assets/images/dinosaur.png',
                width: 50,
              ),
            ),
            Positioned(
              right: cactusController!.value,
              bottom: 410,
              child: Image.asset(
                'assets/images/cactus.png',
                width: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
