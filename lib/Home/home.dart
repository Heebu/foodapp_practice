import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          Container(
            height: 70,
            color: Colors.transparent,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText1(
                      text: 'Hi, Heebu-Prime',
                      size: 30,
                      fontWeight: FontWeight.w700,
                    ),
                    AppText1(
                      text: 'Ready to cook for dinner?',
                      size: 17,
                      fontWeight: FontWeight.normal,
                      color: Colors.white60,
                    ),
                  ],
                ),
                Spacer(),
                Container(
                    padding: EdgeInsets.all(2),
                    height: 60,
                    width: 60,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              // image: DecorationImage(
                              //   image: NetworkImage(''),
                              // ),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(),
                              color: Colors.orange,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.person,
                                size: 50,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.circle,
                            color: Colors.red,
                            size: 20,
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 170,
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(color: Colors.white24),
              boxShadow: [
                BoxShadow(color: Colors.black12, offset: Offset(10, 10)),
              ],
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.grey.shade800,
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(25),
                  width: 240,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText1(
                          text: 'Menu for recipies',
                          size: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AppText1(
                          text: 'Chicken Baked',
                          size: 25,
                          fontWeight: FontWeight.w700,
                          color: Colors.orange,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.orange,
                              ),
                              child: Icon(
                                Icons.timer_outlined,
                              ),
                            ),
                            AppText1(
                              text: '30 mins',
                              size: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.orange,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.orange,
                              ),
                              child: Icon(
                                Icons.timer_outlined,
                              ),
                            ),
                            AppText1(
                              text: 'Easy cook',
                              size: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.orange,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/image/Fried-chicken-legs-isolated-on-transparent-background-PNG-removebg-preview.png'),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              AppText1(
                  text: 'Meal Category', size: 30, fontWeight: FontWeight.bold),
              Spacer(),
              AppText1(
                  text: 'see all',
                  size: 15,
                  color: Colors.white60,
                  fontWeight: FontWeight.normal),
            ],
          ),
          Row(
            children: [
              MealCategory(
                  text: 'Dinner',
                  icon: Icons.local_pizza_outlined,
                  color: Colors.orange,
                  textColor: Colors.black),
              MealCategory(
                  text: 'supper',
                  icon: Icons.set_meal_outlined,
                  color: Colors.white10,
                  textColor: Colors.white60),
              MealCategory(
                  text: 'Snack',
                  icon: Icons.fastfood_rounded,
                  color: Colors.white10,
                  textColor: Colors.white60),
            ],
          ),
          Wrap(
            children: [
              FoodItems(
                  text: 'Garllic Shrimp Spaghetti',
                  image: 'assets/image/shrimp.jpg',
                  time: '60',
                  level: 'Hard'),
              FoodItems(
                  text: 'GPenne Chicken Carbonara',
                  image:
                      'assets/image/Fried-chicken-legs-isolated-on-transparent-background-PNG-removebg-preview.png',
                  time: '40',
                  level: 'Easy'),
              FoodItems(
                  text: 'GPenne Chicken Carbonara',
                  image: 'assets/image/photo.jpg',
                  time: '40',
                  level: 'Easy'),
              FoodItems(
                  text: 'GPenne Chicken Carbonara',
                  image: 'assets/image/shrimp.jpg',
                  time: '40',
                  level: 'Easy'),
            ],
          )
        ],
      ),
    );
  }
}

class FoodItems extends StatelessWidget {
  const FoodItems({
    Key? key,
    required this.text,
    required this.image,
    required this.time,
    required this.level,
  }) : super(key: key);
  final String text;
  final String image;
  final String time;
  final String level;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      width: 180,
      padding: EdgeInsets.all(10),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 200,
              width: 170,
              decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      text,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      height: 30,
                      padding: EdgeInsets.all(10),
                      child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => StarIcon(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            AppText1(
                                text: time,
                                size: 15,
                                fontWeight: FontWeight.normal),
                            AppText1(
                                text: 'Min',
                                size: 15,
                                fontWeight: FontWeight.normal),
                          ],
                        ),
                        Divider(
                          thickness: 40,
                          height: 20,
                          color: Colors.white,
                        ),
                        Column(
                          children: [
                            AppText1(
                                text: level,
                                size: 15,
                                fontWeight: FontWeight.normal),
                            AppText1(
                                text: 'Level',
                                size: 15,
                                fontWeight: FontWeight.normal),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(image),
                backgroundColor: Colors.white,
              ))
        ],
      ),
    );
  }
}

class StarIcon extends StatelessWidget {
  const StarIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star,
      color: Colors.orange,
      size: 17,
    );
  }
}

class MealCategory extends StatelessWidget {
  const MealCategory({
    Key? key,
    required this.text,
    required this.icon,
    required this.color,
    required this.textColor,
  }) : super(key: key);
  final String text;
  final IconData icon;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      width: 100,
      child: Center(
        child: Row(
          children: [
            Icon(icon),
            Spacer(),
            AppText1(
              text: text,
              size: 15,
              fontWeight: FontWeight.normal,
              color: textColor,
            ),
          ],
        ),
      ),
    );
  }
}

class AppText1 extends StatelessWidget {
  AppText1({
    Key? key,
    required this.text,
    required this.size,
    required this.fontWeight,
    this.color = Colors.white,
  }) : super(key: key);
  final String text;
  final double size;
  final FontWeight fontWeight;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}

//https://cdn.dribbble.com/users/2947819/screenshots/15125197/media/e91abb2d0a6337eccd65be1523365ccf.png?compress=1&resize=768x576&vertical=top
