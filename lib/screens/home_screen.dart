import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:team_apt_taks/data/data_source.dart';
import 'package:team_apt_taks/screens/details_screen.dart';
import 'package:team_apt_taks/util/string_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controllerA;

  @override
  void initState() {
    _controllerA = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    // Future.delayed(Duration.zero, () => _controllerA.animateBack(-0.60));
    super.initState();
  }

  final Tween<double> turnsTween = Tween<double>(
    begin: 0,
    end: -0.1,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
                  Spacer(),
                  IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                ],
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dataSource.categories.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Chip(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            shape: const StadiumBorder(
                                side: BorderSide(color: Colors.grey)),
                            label: Text(
                              dataSource.categories[index],
                              style: TextStyle(fontSize: 18),
                            )),
                      );
                    }),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: 400,
                          width: double.maxFinite,
                          child: ListView.builder(
                              itemCount: 5,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return OpenContainer(
                                  transitionType:
                                      ContainerTransitionType.fadeThrough,
                                  openElevation: 0.0,
                                  closedElevation: 0.0,
                                  transitionDuration:
                                      Duration(milliseconds: 700),
                                  onClosed: (_) {},
                                  closedBuilder: (BuildContext context,
                                      void Function() action) {
                                    return Container(
                                      width: 340,
                                      margin: const EdgeInsets.only(
                                          top: 24.0, bottom: 24.0, left: 16),
                                      child: Stack(
                                        children: [
                                          Positioned.fill(
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 300,
                                                  decoration: BoxDecoration(
                                                      color: Colors.green,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0)),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            right: 0,
                                            bottom: 10,
                                            child: SizedBox(
                                              width: 300,
                                              child: RotationTransition(
                                                turns: turnsTween
                                                    .animate(_controllerA),
                                                child: Image.asset(
                                                  "assets/img/_1_.png",
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  openBuilder: (BuildContext context,
                                      void Function({Object? returnValue})
                                          action) {
                                    return const DetailsScreen();
                                  },
                                );
                              })),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Text("234 OPTIONS"),
                      ),
                      ListView.builder(
                          itemCount: 10,
                          shrinkWrap: true,
                          physics: PageScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: SizedBox(
                                      width: 100,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Undercover React Presto"),
                                        Text(StringUtils.formatMoney(12700)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
