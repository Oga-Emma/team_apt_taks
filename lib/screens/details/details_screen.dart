import 'package:flutter/material.dart';
import 'package:team_apt_taks/data/data_source.dart';
import 'package:team_apt_taks/data/model/shoe.dart';
import 'package:team_apt_taks/util/string_utils.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.shoe}) : super(key: key);
  final Shoe shoe;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeAnimation;
  late Animation<double> _fadeInFadeOut;
  late AnimationController _controllerA;

  late AnimationController translationA;
  late AnimationController translationB;

  late Animation translateAnimationA;
  late Animation translateAnimationB;
  @override
  void initState() {
    _controllerA = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..forward();

    translationA = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..forward();

    translationB = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..forward();

    translateAnimationA = Tween<double>(
      begin: 20,
      end: 0,
    ).animate(translationA);
    translationA.forward();

    translationB =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    translateAnimationB = Tween<double>(
      begin: 10,
      end: 0,
    ).animate(translationB);

    _fadeAnimation =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1).animate(_fadeAnimation);

    translationB.forward();
    _fadeAnimation.forward(); //.whenComplete(() => setState(() {}));
    super.initState();
  }

  final Tween<double> turnsTween = Tween<double>(
    begin: -0.05,
    end: -0.1,
  );
  @override
  void dispose() {
    _controllerA.dispose();
    translationA.dispose();
    translationB.dispose();
    _fadeAnimation.dispose();
    // translationC.dispose();
    // translationD.dispose();
    // translationE.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Positioned(
                      top: -500,
                      right: -100,
                      left: 0,
                      bottom: 0,
                      child: Transform.translate(
                        offset: Offset(0.0, translateAnimationA.value),
                        child: Container(
                          height: 600,
                          decoration: BoxDecoration(
                              color: widget.shoe.color,
                              borderRadius: BorderRadius.circular(1000)
                              // shape: BoxShape.circle,
                              ),
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
                            "assets/img/${widget.shoe.image}.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back,
                                  color: Colors.white)),
                          const Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.search,
                                  color: Colors.white)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              FadeTransition(
                opacity: _fadeInFadeOut,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: translate(
                        animation: translateAnimationA,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  widget.shoe.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20),
                                )),
                                const Text("${StringUtils.NAIRA} 12,995",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                            SizedBox(height: 16),
                            const Text(
                                "In the game's crucial moments, KD thrives He takes over on both ends of the courth, making defenders fear his unstoppable...",
                                style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    translate(
                        animation: translateAnimationB,
                        child: SelectStyleArea(shoe: widget.shoe)),
                    // SizedBox(height: 4),
                    body(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          translate(
            animation: translateAnimationB,
            child: const Text("Select Size",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 8),
          translate(
              animation: translateAnimationB, child: const SelectSizeArea()),
          MaterialButton(
            color: Colors.black,
            height: 50,
            minWidth: double.maxFinite,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
            onPressed: () {},
            child: const Text(
              "Add to Bag",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget translate({required Widget child, required Animation animation}) {
    return Transform.translate(
      offset: Offset(0.0, animation.value),
      child: child,
    );
  }
}

class SelectStyleArea extends StatefulWidget {
  const SelectStyleArea({required this.shoe, Key? key}) : super(key: key);
  final Shoe shoe;

  @override
  _SelectStyleAreaState createState() => _SelectStyleAreaState();
}

class _SelectStyleAreaState extends State<SelectStyleArea> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
            3, (i) => _item(() => select(i), selected: index == i)),
      ),
    );
  }

  Widget _item(Function() onTap,
      {bool disabled = false, bool selected = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 0.0, left: 24.0),
      child: InkWell(
        onTap: disabled ? null : onTap,
        child: Container(
          width: 90,
          padding: const EdgeInsets.all(4.0),
          alignment: Alignment.center,
          child: Image.asset("assets/img/${widget.shoe.image}.png"),
          decoration: BoxDecoration(
              // image: AssetImage(assetName),
              border: Border.all(
                  color: selected ? Colors.black : Colors.grey.shade200,
                  width: selected ? 2 : 1),
              borderRadius: BorderRadius.circular(20.0),
              color: disabled ? Colors.green.withOpacity(0.05) : null),
        ),
      ),
    );
  }

  int index = 0;
  select(int i) {
    setState(() {
      index = i;
    });
  }
}

class SelectSizeArea extends StatefulWidget {
  const SelectSizeArea({Key? key}) : super(key: key);

  @override
  _SelectSizeAreaState createState() => _SelectSizeAreaState();
}

class _SelectSizeAreaState extends State<SelectSizeArea> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: GridView.extent(
        shrinkWrap: true,
        physics: PageScrollPhysics(),
        maxCrossAxisExtent: 80,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 2,
        children: [
          _gridItem("UK 6", () => select(0), selected: index == 0),
          _gridItem("UK 7", () => select(1), selected: index == 1),
          _gridItem("UK 8", () => select(2), selected: index == 2),
          _gridItem("UK 9", () => select(3), selected: index == 3),
          _gridItem("UK 10", () => select(4), selected: index == 4),
          _gridItem("UK 11", () => select(5),
              selected: index == 5, disabled: true),
          _gridItem("UK 12", () => select(6), selected: index == 6),
          _gridItem("UK 13", () => select(7),
              selected: index == 7, disabled: true),
        ],
      ),
    );
  }

  Widget _gridItem(String label, Function() onTap,
      {bool disabled = false, bool selected = false}) {
    return InkWell(
      onTap: disabled ? null : onTap,
      child: Container(
        height: 20,
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(color: disabled ? Colors.grey.shade400 : null),
        ),
        decoration: BoxDecoration(
            border: Border.all(
                color: selected ? Colors.black : Colors.grey.shade200,
                width: selected ? 2 : 1),
            borderRadius: BorderRadius.circular(12.0),
            color: disabled ? Colors.green.withOpacity(0.05) : null),
      ),
    );
  }

  select(int i) {
    setState(() {
      index = i;
    });
  }
}
