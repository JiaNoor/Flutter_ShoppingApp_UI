import 'package:flutter/material.dart';
import 'objects.dart';

class Favt extends StatefulWidget {
  const Favt({Key? key}) : super(key: key);

  @override
  _FavtState createState() => _FavtState();
}

class _FavtState extends State<Favt> {
  void delete_Fv(String n, String i, String p) {
    setState(() {
      names2.remove(n);
      imgs2.remove(i);
      price2.remove(p);
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
          "Favorites",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
          itemCount: names2.length,
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
                            image: AssetImage(imgs2[index]),
                            width: MediaQuery.of(context).size.width * .35,
                            height: MediaQuery.of(context).size.height * 0.3,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            names2[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(price2[index]),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              delete_Fv(
                                  names2[index], imgs2[index], price2[index]);
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
          }),
    );
  }
}
