import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final mySizedh10 = SizedBox(
  height: 10,
);
final mySizedh30 = SizedBox(
  height: 20,
);
final mySizedh25 = SizedBox(
  height: 25,
);
final mySizedh40 = SizedBox(
  height: 40,
);

class DonutPage extends StatelessWidget {
  const DonutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // mySizedh30,
          donut_back_like(),
          donut_name_ingredients(),
          mySizedh40,
          donut_ratting(),
          donut_description(),
          mySizedh10,
          donut_price_remove_add(),
          mySizedh25,
          donut_addTo_bag()
        ],
      ),
    );
  }

  Container donut_addTo_bag() {
    return Container(
      padding: const EdgeInsets.all(13),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: const Color(0xFF445cee),
          borderRadius: BorderRadius.circular(10)),
      child: const Center(
        child: Text(
          'Add to bag',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Padding donut_price_remove_add() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            '\$ 5.50',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0xFF5f6c82)),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(8)),
                child: Icon(
                  Icons.remove,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              const Text('1'),
              const SizedBox(
                width: 15,
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFc7cef7),
                    borderRadius: BorderRadius.circular(8)),
                height: 40,
                width: 40,
                child: const Icon(
                  Icons.add,
                  color: Color(0xFF5666c9),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Container donut_description() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: const Text(
        'Chocolate lovers, rejoice! This donut is a chocolate lover\'s dream. It\'s coated in a rich chocolate glaze and generously sprinkled with crushed peanuts, creating a delightful combination of flavors and textures.',
        style: TextStyle(fontWeight: FontWeight.w400, height: 1.4),
      ),
    );
  }

  Padding donut_ratting() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '⭐ 5.0',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('🔥 563 kcal', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('⏰ 5-10 min ', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Padding donut_name_ingredients() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Choco-Nut Crunch',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5f6c82)),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'chocolate donut, chocolate glaze, crushed peanuts ',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  ClipPath donut_back_like() {
    return ClipPath(
      clipper: Clipper(),
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('lib/images/background.jpg'))),
        height: 460,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // mySizedh30,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.arrow_back_ios_new),
                    Icon(Icons.favorite_border),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                SvgPicture.asset(
                  'lib/images/donut-3.svg',
                  height: 140,
                  width: 140,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    double w = size.width;
    double h = size.height;
    double curve = 100;

    path.lineTo(0, h - curve);
    path.quadraticBezierTo(w * 0.5, h, h, w - curve);
    path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
