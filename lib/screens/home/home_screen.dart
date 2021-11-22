import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:team_apt_taks/data/data_source.dart';
import 'package:team_apt_taks/data/model/shoe.dart';
import 'package:team_apt_taks/screens/details/details_screen.dart';
import 'package:team_apt_taks/screens/home/shoe_list_area.dart';
import 'package:team_apt_taks/util/string_utils.dart';

import 'show_preview_area.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controllerA;

  late List<Shoe> localList;

  @override
  void initState() {
    _controllerA = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    this.localList = dataSource.shoes;
    // Future.delayed(Duration.zero, () => _controllerA.animateBack(-0.60));
    super.initState();
  }

  final Tween<double> turnsTween = Tween<double>(
    begin: 0,
    end: -0.1,
  );

  String category = "All";

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark
            .copyWith(statusBarColor: Colors.transparent),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.arrow_back)),
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
                          var item = dataSource.categories[index];
                          bool selected = category == item;
                          return Padding(
                            padding:
                                const EdgeInsets.only(right: 4.0, left: 16.0),
                            child: InkWell(
                              onTap: () => setState(() {
                                localList..shuffle();
                                category = item;
                              }),
                              child: Chip(
                                  backgroundColor: selected
                                      ? Colors.black
                                      : Colors.grey.shade200,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 16.0),
                                  shape: StadiumBorder(
                                      side: BorderSide(
                                          color: selected
                                              ? Colors.black
                                              : Colors.grey.shade400)),
                                  label: Text(
                                    dataSource.categories[index],
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: selected
                                            ? Colors.white
                                            : Colors.grey.shade700),
                                  )),
                            ),
                          );
                        }),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShoePreviewArea(
                            shoes: [
                              ...category == "All"
                                  ? localList
                                  : localList
                                      .where((element) =>
                                          element.categories.contains(category))
                                      .toList()
                            ],
                          ),
                          ShowListArea(shoes: localList.take(5).toList()),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
