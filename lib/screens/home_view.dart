import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  AnimationController? dinosaurController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    dinosaurController = AnimationController(
        vsync: this,
        lowerBound: 410,
        upperBound: 500,
        duration: Duration(milliseconds: 800));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        
      ),
    );
  }
}
