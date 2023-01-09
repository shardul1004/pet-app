import 'package:flutter/material.dart';
import 'package:buddy/colors/colors.dart';
class shopList extends StatefulWidget {
  const shopList({Key? key}) : super(key: key);

  @override
  State<shopList> createState() => _shopListState();
}

class _shopListState extends State<shopList> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appColor.barcolor,
        leading: Icon(
          Icons.bookmark_border_outlined,
          size: 35,
          color: appColor.iconColor,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.shopping_cart,
              size: 35,
              color: appColor.iconColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: appColor.barcolor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: SizedBox(
                      width: ((MediaQuery.of(context).size.width) - 60),
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            suffixIcon: Icon(
                              Icons.search,
                              color: appColor.iconColor,
                            ),
                            hintText: "Search...",
                            contentPadding: EdgeInsets.only(top: 15, left: 15),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            )),
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
