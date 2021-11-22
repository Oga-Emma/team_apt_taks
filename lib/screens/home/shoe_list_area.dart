import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team_apt_taks/data/model/shoe.dart';
import 'package:team_apt_taks/screens/details/details_screen.dart';
import 'package:team_apt_taks/util/string_utils.dart';

class ShowListArea extends StatelessWidget {
  const ShowListArea({Key? key, required this.shoes}) : super(key: key);
  final List<Shoe> shoes;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            "234 OPTIONS",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey.shade500),
          ),
        ),
        Divider(),
        ListView.separated(
            itemCount: shoes.length,
            shrinkWrap: true,
            physics: const PageScrollPhysics(),
            itemBuilder: (context, index) {
              var shoe = shoes[index];
              return OpenContainer(
                transitionType: ContainerTransitionType.fadeThrough,
                openElevation: 0.0,
                closedElevation: 0.0,
                transitionDuration: const Duration(milliseconds: 500),
                onClosed: (_) {},
                closedBuilder: (BuildContext context, void Function() action) {
                  return listItem(shoe);
                },
                openBuilder: (BuildContext context,
                    void Function({Object? returnValue}) action) {
                  return DetailsScreen(shoe: shoe);
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) => Divider()),
      ],
    );
  }

  Widget listItem(Shoe shoe) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Image.asset(
              "assets/img/${shoe.image}.png",
              // width: 100,
              height: 60,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(shoe.name, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text("${StringUtils.NAIRA} 12,995",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                        fontSize: 12)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
