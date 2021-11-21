import 'package:flutter/material.dart';
import 'package:shopping_app/screens/cart.dart';
import 'package:shopping_app/screens/drawer.dart';
import 'package:shopping_app/screens/favorites.dart';
import 'package:shopping_app/screens/items_description.dart';
import 'package:shopping_app/screens/profile.dart';
import 'package:shopping_app/screens/search.dart';
import 'objects.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isFavorited = true;
  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
      } else {
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (ind != names1.length) {
      setState(() {
        ind = names1.length;
      });
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[100],
        title: Text(
          "Home Page",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Favt()));
            },
            icon: Icon(Icons.favorite),
            color: Colors.orange[900],
          ),
          Stack(children: [
            Positioned(
              child: Center(
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartAdd()));
                  },
                  icon: Icon(Icons.shopping_cart),
                  color: Colors.orange[900],
                ),
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: new Container(
                padding: EdgeInsets.all(2),
                decoration: new BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(8),
                ),
                constraints: BoxConstraints(
                  minWidth: 14,
                  minHeight: 14,
                ),
                child: Text(
                  '$ind',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 9,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ]),
        ],
      ),
      drawer: AppDrawer(), //Drawer
      body: Column(
        children: [
          Flexible(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: prod1.length,
                  itemBuilder: (context, index) {
                    return header(
                        prod1[index], rem[index], img1[index], context);
                  }),
            ),
          ),
          Expanded(
            flex: 3,
            child: ListView.builder(
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => cart(names[index],
                                  price[index], imgs[index], context)));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 10, bottom: 10, left: 40, right: 40),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        elevation: 3.0,
                        child: Container(
                          padding: EdgeInsets.only(left: 20.0, right: 20.0),
                          width: MediaQuery.of(context).size.width - 20.0,
                          height: MediaQuery.of(context).size.height * 0.51,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      if (_isFavorited == true) {
                                        names2.add(names[index]);
                                        price2.add(price[index]);
                                        imgs2.add(imgs[index]);
                                      } else {
                                        names2.remove(names[index]);
                                        price2.remove(price[index]);
                                        imgs2.remove(imgs[index]);
                                      }
                                      _toggleFavorite();
                                    },
                                    icon: (_isFavorited
                                        ? const Icon(Icons.favorite_border)
                                        : const Icon(Icons.favorite)),
                                    color: Colors.red[500],
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                          color: Colors.orange[900],
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
                                      height: 20,
                                      width: 50,
                                      child: Text("30% off")),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                    image: AssetImage(imgs[index]),
                                    width:
                                        MediaQuery.of(context).size.width * .35,
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    names[index],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(price[index]),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      names1.add(names[index]);
                                      price1.add(price[index]);
                                      imgs1.add(imgs[index]);
                                      setState(() {
                                        ind = names1.length;
                                      });
                                    },
                                    icon: Icon(Icons.shopping_cart_outlined),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
      bottomNavigationBar: bottom(context),
    );
  }
}

//Header Content of Screen
Widget header(String product, String rem, String img, context) {
  return InkWell(
      child: Padding(
          padding: EdgeInsets.all(10),
          child: Material(
            borderRadius: BorderRadius.circular(6.0),
            elevation: 2,
            child: Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              width: MediaQuery.of(context).size.width * .42,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    image: AssetImage(img),
                    width: MediaQuery.of(context).size.width * .1,
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(product,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      Flexible(child: Text(rem)),
                    ],
                  )
                ],
              ),
            ),
          )));
}

//Bottom Navigation Bar
Widget bottom(context) {
  return BottomAppBar(
    child: Container(
      height: 60.0,
      width: double.maxFinite,
      decoration: const BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.vertical()),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: [
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: Colors.orange[900],
                ),
                onPressed: () {},
              ),
              Text(
                "Home",
                style: TextStyle(
                  color: Colors.orange[900],
                  fontSize: 8,
                ),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.orange[900],
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchBar()));
                },
              ),
              Text(
                "Search",
                style: TextStyle(
                  color: Colors.orange[900],
                  fontSize: 8,
                ),
              ),
            ],
          ),
          Column(children: [
            IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.orange[900],
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
            ),
            Text(
              "Profile",
              style: TextStyle(
                color: Colors.orange[900],
                fontSize: 8,
              ),
            ),
          ]),
        ],
      ),
    ),
  );
}
