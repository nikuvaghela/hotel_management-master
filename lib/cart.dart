import 'package:flutter/material.dart';
import 'package:hotel_management/Module.dart';

class cart extends StatefulWidget {

  List<String> item;
  List<double> itemprice;
  double total;

  cart( this.item, this.itemprice, this.total);



  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {

  double gst = 0;
  double total_pay = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gst = widget.total * (18 / 100);
    total_pay = widget.total + (widget.total * (18 / 100));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              alignment: Alignment.center,
              child: Image.network(
                  'https://cdn.pixabay.com/photo/2020/04/10/13/23/paid-5025785_960_720.png'),
            ),
            Expanded(child: ListView.builder(itemCount: widget.item.length,itemBuilder: (context, index) {
              return Card(
                  margin: EdgeInsets.all(5),
                  child: ListTile(
                    title: Text("${widget.item[index]}"),
                    trailing: Text("${widget.itemprice[index]}"),
                  ));
            },)),
            Card(
                child: ListTile(
                  title: Text("Total  :  "),
                  trailing: Text("${widget.total}"),
                )
            ),
            Card(
                child: ListTile(
                  title: Text("GST  :  "),
                  trailing: Text("$gst"),
                )
            ),
            Card(
              color: Color(0xffdabb00),
              child: ListTile(
                title: Text("Total Payable Amount  :  "),
                trailing: Text("$total_pay"),
              )
              ),
          ],
        ),
      ),
    );
  }
}
