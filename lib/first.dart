
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_management/Module.dart';
import 'package:hotel_management/cart.dart';

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  List<bool> check = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  List<String> list = [
    'Veggie Pizza',
    'DOUBLE CHEESE MARGHERITA',
    'Margherita Pizza',
    'FARM HOUSE',
    'DELUXE VEGGIE',
    'MEXICAN GREEN WAVE',
    'PEPPY PANEER',
    'VEG EXTRAVAGANZA',
    'CHEESE N CORN',
    'INDI TANDOORI PANEER',
  ];
  List<String> links = [
    'https://www.dominos.co.in/files/items/Fresh_Veggie.jpg',
    'https://www.dominos.co.in/files/items/Double_Cheese_Margherita.jpg',
    'https://www.dominos.co.in/files/items/Margherit.jpg',
    'https://www.dominos.co.in/files/items/Farmhouse.jpg',
    'https://www.dominos.co.in/files/items/Farmhouse.jpg',
    'https://www.dominos.co.in/files/items/Mexican_Green_Wave.jpg',
    'https://www.dominos.co.in/files/items/Mexican_Green_Wave.jpg',
    'https://www.dominos.co.in/files/items/Veg_Extravaganz.jpg',
    'https://www.dominos.co.in/files/items/Corn_&_Cheese.jpg',
    'https://www.dominos.co.in/files/items/IndianTandooriPaneer.jpg',
  ];
  List<double> price = [
    375,475,250,450,550,650,775,1000,175,475
  ];
  int count = 0;
  double total = 0;
  List<String> item = [];
  List<double> itemprice = [];
  List<int> pos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return cart(item,itemprice,total);
                  },
                ));
              },
              icon: Icon(Icons.shopping_cart))
        ],
        backgroundColor: Color(0xffdabb00),
        title: Text(
          "Twiggy",
          style: TextStyle(
              fontFamily: 'SfPro',
              color: Colors.black,
              fontSize: 20,
              letterSpacing: 1.0),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                itemCount: check.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Card(
                            margin: EdgeInsets.all(5),
                            child: CheckboxListTile(
                              secondary: Image.network(
                                '${links[index]}',
                                fit: BoxFit.cover,
                              ),
                              subtitle: Text("${price[index]}"),
                              controlAffinity: ListTileControlAffinity.trailing,
                              title: Text(
                                "${list[index]}",
                                style: TextStyle(
                                    fontFamily: 'SfPro',
                                    color: Colors.black,
                                    fontSize: 20,
                                    letterSpacing: 1.0),
                              ),
                              value: check[index],
                              onChanged: (value) {
                                if (value != null) {
                                  check[index] = value;
                                  print(value);
                                  if(value)
                                    {
                                      total = total + price[index];
                                      item.add(list[index]);
                                      itemprice.add(price[index]);

                                    }
                                  else
                                    {
                                      total = total - price[index];
                                      item.remove(list[index]);
                                      itemprice.remove(price[index]);
                                    }
                                  setState(() {});
                                }
                              },
                            ),
                      ),

                    ],
                  );
                },
              ),
            ),
          ElevatedButton(style: ElevatedButton.styleFrom(primary: Color(0xffdabb00)),onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return cart(item,itemprice,total);
            },));
          }, child: Text("Total :  ₹ ${total}",style: TextStyle(fontSize: 20,color: Colors.black),))
        ],
      ),
    );
  }
}
