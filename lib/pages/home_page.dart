import 'package:donut_app_ui/pages/donut_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floating_btn(),
      //body
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    images['background']!,
                  ),
                  fit: BoxFit.cover)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              mySizedh30,
              //menu icon and avatar
              menuAndProfile(),

              const SizedBox(
                height: 30,
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Hi, Kushal! 👋',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              searchBar(),

              const SizedBox(
                height: 20,
              ),

              Container(
                height: 70,
                margin: const EdgeInsets.only(left: 10),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    TitleName('Donuts', 100, titleImage[0][0], 5,
                        Colors.grey.shade100),
                    TitleName('', 50, titleImage[1][0], 0, Colors.white54),
                    TitleName('', 50, titleImage[2][0], 0, Colors.white54),
                    TitleName(' ', 50, titleImage[3][0], 0, Colors.white54),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              //donut grid view
              donuts_grid_view()
            ],
          ),
        ),
      ),
    );
  }

  Expanded donuts_grid_view() {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: .7,
              crossAxisCount: 2),
          itemCount: 4,
          itemBuilder: (context, index) {
            return donutGridView(index);
          }),
    ));
  }

  FloatingActionButton floating_btn() {
    return FloatingActionButton(
      backgroundColor: const Color(0xFFf21466),
      onPressed: () {},
      child: Container(
        height: 30,
        width: 30,
        child: Image.asset(images['trolley']!),
      ),
    );
  }
}

Map<String, String> images = {
  'trolley': 'lib/images/trolley.png',
  'menu': 'lib/images/main-menu.png',
  'profile': 'lib/images/man.png',
  'background': 'lib/images/background.jpg',
};

List<String> donutImg = [
  'lib/images/donut-1.svg',
  'lib/images/donut-2.svg',
  'lib/images/donut-3.svg',
  'lib/images/donut-4.svg',
];

List<String> donutTitle = [
  'Matcha Madness',
  'Caramel Delight',
  'Choco-Nut Crunch',
  'Berry Bliss',
];

List<String> donutIngredients = [
  'matcha-infused donut, matcha glaze ',
  'Glazed, donut, Creamy, caramel, filling , Toasted, almonds',
  'chocolate donut, chocolate glaze, crushed peanuts ',
  'Glased donut, Mixed berry compote filling, powdered sugar ',
];

List<String> donutPrice = [
  '2.50',
  '2.75',
  '3.50',
  '2.20',
];

List titleImage = [
  ['lib/images/donut.png'],
  ['lib/images/cake-slice.png'],
  ['lib/images/croissant.png'],
  ['lib/images/candy.png'],
];

Widget menuAndProfile() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 35,
          width: 35,
          child: Image.asset(images['menu']!),
        ),
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(images['profile']!),
        )
      ],
    ),
  );
}

Widget TitleName(
    String name, double width, String img, double sizedWidth, Color backColor) {
  return Container(
    decoration: BoxDecoration(
        color: backColor, borderRadius: BorderRadius.circular(40)),
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(6),
    height: 10,
    width: width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 20, width: 20, child: Image.asset(img)),
        SizedBox(
          width: sizedWidth,
        ),
        Text(name)
      ],
    ),
  );
}

Widget donutGridView(int index) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30), color: Colors.white60),
    // margin: EdgeInsets.symmetric(horizontal: 20),
    height: 150,
    width: 100,
    child: Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SvgPicture.asset(
              donutImg[index],
              height: 60,
              width: 60,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                donutTitle[index],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                donutIngredients[index],
                style: TextStyle(fontSize: 11, color: Colors.grey[600]),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$ ' + donutPrice[index],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.shopping_cart,
                    size: 19,
                  ))
            ],
          )
        ],
      ),
    ),
  );
}

Widget searchBar() {
  return Container(
    decoration: BoxDecoration(
        color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
    padding: const EdgeInsets.all(15),
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('search'),
        Icon(
          Icons.search,
          color: Colors.grey[600],
        ),
      ],
    ),
  );
}
