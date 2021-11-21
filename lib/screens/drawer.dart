import 'package:flutter/material.dart';
import 'package:shopping_app/screens/about.dart';
import 'package:shopping_app/screens/cart.dart';
import 'package:shopping_app/screens/favorites.dart';
import 'package:shopping_app/screens/login.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: draw(context),
    );
  }
}

Widget draw(context) {
  final List<String> items = [
    'Logout',
    'Cart',
    'Favourite',
    'About',
  ];
  List<dynamic> cls = [
    Login(),
    CartAdd(),
    Favt(),
    About(),
  ];

  List<IconData> icons = [
    Icons.logout,
    Icons.shopping_cart,
    Icons.favorite,
    Icons.more,
  ];
  return SingleChildScrollView(
    child: Column(
      children: [
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          accountName: Text(
            "Javeria Noor",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          accountEmail: Text(
            "user@gmail.com",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          currentAccountPicture: Center(
            child: CircleAvatar(
              radius: 55.0,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
          ),
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => cls[index]));
              },
              leading: Icon(
                icons[index],
              ),
              title: Text(items[index]),
            );
          },
        )
      ],
    ),
  );
}
