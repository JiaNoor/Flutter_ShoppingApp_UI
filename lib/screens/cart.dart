import 'package:flutter/material.dart';
import 'package:shopping_app/screens/objects.dart';

class CartAdd extends StatefulWidget {
  const CartAdd({Key? key}) : super(key: key);

  @override
  _CartAddState createState() => _CartAddState();
}

class _CartAddState extends State<CartAdd> {
  void delete(String n, String i, String p) {
    setState(() {
      names1.remove(n);
      imgs1.remove(i);
      price1.remove(p);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
          ),
          title: Text(
            "My Cart",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView.builder(
            itemCount: names1.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 40, right: 40),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.blue[900],
                                    borderRadius: BorderRadius.circular(5.0)),
                                height: 20,
                                width: 70,
                                child: Text("CheckOut")),
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.orange[900],
                                    borderRadius: BorderRadius.circular(5.0)),
                                height: 20,
                                width: 50,
                                child: Text("30% off")),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage(imgs1[index]),
                              width: MediaQuery.of(context).size.width * .35,
                              height: MediaQuery.of(context).size.height * 0.3,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              names1[index],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(price1[index]),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                delete(
                                    names1[index], imgs1[index], price1[index]);
                              },
                              icon: Icon(Icons.delete),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
