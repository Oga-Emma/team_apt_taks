import 'package:animations/animations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:team_apt_taks/data/data_source.dart';
import 'package:team_apt_taks/data/model/shoe.dart';
import 'package:team_apt_taks/screens/details/details_screen.dart';
import 'package:team_apt_taks/util/string_utils.dart';

class ShoePreviewArea extends StatelessWidget {
  const ShoePreviewArea({Key? key, required this.shoes}) : super(key: key);
  final List<Shoe> shoes;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 360,
        width: double.maxFinite,
        child: ListView.builder(
            itemCount: shoes.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var shoe = shoes[index];
              return OpenContainer(
                transitionType: ContainerTransitionType.fadeThrough,
                openElevation: 0.0,
                closedElevation: 0.0,
                transitionDuration: const Duration(milliseconds: 400),
                onClosed: (_) {},
                closedBuilder: (BuildContext context, void Function() action) {
                  return Container(
                    width: 300,
                    margin: const EdgeInsets.only(
                        top: 24.0, bottom: 24.0, left: 16),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Row(
                            children: [
                              Container(
                                width: 260,
                                decoration: BoxDecoration(
                                    color: shoe.color,
                                    borderRadius: BorderRadius.circular(16.0)),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 10,
                          left: 20,
                          child: Image.asset(
                            "assets/img/${shoe.image}.png",
                            fit: BoxFit.cover,
                            height: 170,
                            // width: 300,
                          ),
                        ),
                        Positioned(
                          left: 16,
                          top: 16,
                          bottom: 50,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                shoe.name,
                                style: TextStyle(
                                    color: shoe.textColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20),
                              ),
                              SizedBox(height: 2),
                              Text(
                                "${StringUtils.NAIRA} 12,995",
                                style: TextStyle(
                                    color: shoe.textColor,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15),
                              ),
                              SizedBox(height: 10),
                              Expanded(
                                child: VerticalDivider(
                                  width: 10,
                                  color: shoe.textColor.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                openBuilder: (BuildContext context,
                    void Function({Object? returnValue}) action) {
                  return DetailsScreen(shoe: shoe);
                },
              );
            }));
  }
}
