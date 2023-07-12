import 'package:donut_app_ui/pages/donut_page.dart';
import 'package:donut_app_ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/images/background.jpg'),
              fit: BoxFit.cover)),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            mySizedh10,
            mySizedh30,
            menuAndProfile(),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'My Cart',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: ((context, index) {
                      return CartTile(donutTitle[index], donutImg[index],
                          '\$ ${donutPrice[index]}');
                    }))),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  subtotal_price(),
                  SizedBox(
                    height: 20,
                  ),
                  discount_price(),
                  Row(
                    children: [
                      Expanded(
                          child: Divider(
                        thickness: 2,
                      ))
                    ],
                  ),
                  mySizedh10,
                  total_price(),
                  mySizedh25,
                  checkout_btn(),
                  mySizedh40
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  Row subtotal_price() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Subtotal:'),
        Text('\$ 5.25'),
      ],
    );
  }

  Row discount_price() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text('Discount'), Text('-20%')],
    );
  }

  Row total_price() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          '\$ 4.20',
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Container checkout_btn() {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Color(0xFF445cee), borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: Text(
          'Checkout',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

Widget CartTile(String name, String imgPath, String price) {
  return Container(
    padding: EdgeInsets.all(20),
    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.white60, borderRadius: BorderRadius.circular(15)),
    child: Row(
      children: [
        Container(
            margin: EdgeInsets.all(4),
            height: 60,
            width: 60,
            child: SvgPicture.asset(imgPath)),
        SizedBox(
          width: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 275,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: TextStyle(color: Color(0xFF5f6c82)),
                      ),
                      Text(
                        price,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                donut_price_remove_add()
              ],
            ),
          ],
        )
      ],
    ),
  );
}

Widget donut_price_remove_add() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
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
  );
}

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

Map<String, String> images = {
  'trolley': 'lib/images/trolley.png',
  'menu': 'lib/images/main-menu.png',
  'profile': 'lib/images/man.png',
  'background': 'lib/images/background.jpg',
};
