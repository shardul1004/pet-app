import 'package:flutter/material.dart';
import 'package:buddy/colors/colors.dart';
class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    final PageController _pagecontroller = PageController(viewportFraction: 0.3);
    void dispose() {
      super.dispose();
      _controller.dispose();
    }
    return Scaffold(
      backgroundColor: appColor.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appColor.barcolor,
        leading: Icon(Icons.bookmark_border_outlined,size: 35,color: appColor.iconColor,),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:8.0),
            child: Icon(Icons.shopping_cart,size: 35,color: appColor.iconColor,),
          ),

        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //search bar and horizontal list of categories
            Container(
              height: 240,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: appColor.barcolor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: SizedBox(
                      width: ((MediaQuery.of(context).size.width)-60),
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            suffixIcon: Icon(Icons.search,color: appColor.iconColor,),
                            hintText: "Search...",
                            contentPadding: EdgeInsets.only(top: 15, left: 15),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            )
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) => Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 20,
                            ),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2021/12/26/12/11/dog-6895017_960_720.jpg"),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Grooming"),
                              ],
                            ),
                          ),

                        )
                    ),
                  ),
                ],
              ),
            ),
            // Recomendation text
            Padding(
              padding: const EdgeInsets.only(top:8.0,right: 245,),
              child: Text("Reccomendation",
                  style: TextStyle(
                      fontWeight: FontWeight.w500
                  )),
            ),
            // horizontal list of recomendation
            Stack(
                children: [Container(
                  height: 350,
                  decoration: BoxDecoration(
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context,index)=>Stack(
                        children: [

                          //image and text
                          Container(
                            width: ((MediaQuery.of(context).size.width)*4)/7,
                            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                            decoration:BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top:12.0),
                                  child: Image.network("https://www.primacat.com/sites/default/files/product_images/086ee34eb322d601e514a62750727dc09a5de39c_9181_PrimaCat_Treats_Crunchy_herring_with_rosemary_40_g_6430069583628.png",
                                    width: 150,),
                                ),
                                Text("Cat Food"),
                                Padding(
                                  padding: const EdgeInsets.only(right:180.0,top: 25),
                                  child: Text(r"$10",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red
                                    ),),
                                )
                              ],
                            ),

                          ),
                          //bookmark
                          Align(
                            alignment: AlignmentDirectional.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15.0,left: 220),
                              child: Icon(Icons.bookmark_border,color: appColor.iconColor,size: 30,),
                            ),
                          ),
                          // buy button
                          Align(
                            alignment: AlignmentDirectional.bottomStart,
                            child: Padding(
                              padding: const EdgeInsets.only(left:160.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: appColor.buttoncolor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical:12.0,horizontal: 25),
                                  child: Text("Buy"),
                                ),
                              ),
                            ),
                          ),

                        ]),


                  ),

                ),
                ]),
            // current offers
            SizedBox(height: 8,),
            Container(
              height: 110,
              decoration: BoxDecoration(
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (context,position) => Stack(
                    children: [
                      Container(
                        width: (((MediaQuery.of(context).size.width)*3)/4)-5,
                        margin: EdgeInsets.only(left: 12,top: 8,bottom: 8),
                        decoration: BoxDecoration(
                          color: appColor.offerscolor,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Grooming or all pets",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 9),
                              child: Text(
                                "From 4.06 to 20.06",
                                style: TextStyle(
                                  fontWeight: FontWeight.w200,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:8.0, top: 10.0),
                              child: Text(
                                r"$ 20",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.bottomEnd,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 220.0,bottom: 8.0),
                          child: Image(image: AssetImage('assets/dogncat.png'),width: 100,),
                        ),
                      ),

                    ]),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
