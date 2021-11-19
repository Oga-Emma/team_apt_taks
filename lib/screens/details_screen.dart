import 'package:flutter/material.dart';
import 'package:team_apt_taks/data/data_source.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controllerA;

  @override
  void initState() {
    _controllerA = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..forward();

    // Future.delayed(Duration.zero, () => _controllerA.animateBack(-0.60));
    super.initState();
  }

  final Tween<double> turnsTween = Tween<double>(
    begin: -0.05,
    end: -0.1,
  );

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 400,
              child: Stack(
                children: [
                  Positioned(
                    top: -400,
                    right: -200,
                    left: -40,
                    bottom: 0,
                    child: Container(
                      height: 3000,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 40,
                    left: 40,
                    child: Container(
                      height: 300,
                      width: 300,
                      child: RotationTransition(
                        turns: turnsTween.animate(_controllerA),
                        child: Image.asset(
                          "assets/img/_1_.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      // AnimatedBuilder(
                      //   builder: (context, widget) => Transform.rotate(
                      //     angle: _controllerA.value,
                      //     child: Image.asset(
                      //       "assets/img/_8.png",
                      //       fit: BoxFit.contain,
                      //     ),
                      //   ),
                      //   animation: _controllerA,
                      // ),
                    ),
                  ),
                  SafeArea(
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back)),
                        Spacer(),
                        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
