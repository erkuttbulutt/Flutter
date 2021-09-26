import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Detay extends StatefulWidget {
  var imgPath;
  Detay({this.imgPath});
  @override
  _DetayState createState() => _DetayState();
}

class _DetayState extends State<Detay> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Hero(
              tag: widget.imgPath,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.imgPath), fit: BoxFit.cover)),
              ),
            ),
            Positioned(
              left: 15,
              right: 15,
              bottom: 15,
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 4,
                child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              height: 120,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                image: DecorationImage(
                                    image: AssetImage("assets/dress.jpg"),
                                    fit: BoxFit.contain),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "LAMINATED",
                                style: GoogleFonts.montserrat(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Louis vuitton",
                                style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 30,
                                width: MediaQuery.of(context).size.width - 175,
                                child: Expanded(
                                  child: Text(
                                    "One button V-neck sling long-sleeved waist female stitching dress",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                    /* softWrap: true,
                                    overflow: TextOverflow.visible, */
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(thickness: 1),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, top: 10, right: 30, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$6500",
                              style: GoogleFonts.montserrat(fontSize: 22),
                            ),
                            FloatingActionButton(
                              onPressed: () {},
                              child: Icon(
                                Icons.arrow_forward_ios,
                              ),
                              backgroundColor: Colors.brown,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 300,
              left: 50,
              child: Container(
                height: 40,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black.withOpacity(0.4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Text(
                        "LAMINATED",
                        style: GoogleFonts.montserrat(color: Colors.white),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 18,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
