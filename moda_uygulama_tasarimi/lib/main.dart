import 'package:bolum24_tasarim_yapmak/detay.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  AnaSayfa({Key? key}) : super(key: key);

  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa>
    with SingleTickerProviderStateMixin {
  TabController? myController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    myController?.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TabBar(
        indicatorColor: Colors.transparent,
        controller: myController,
        tabs: [
          Tab(
            icon: Icon(
              Icons.more,
              color: Colors.grey,
              size: 22,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.play_arrow,
              color: Colors.grey,
              size: 22,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.navigation,
              color: Colors.grey,
              size: 22,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.supervised_user_circle,
              color: Colors.grey,
              size: 22,
            ),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text(
          'Moda Uygulaması',
          style: GoogleFonts.montserrat(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.camera_alt),
            color: Colors.grey,
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          //Üst taraftaki profil listesi
          Container(
            height: 140,
            width: double.infinity,
            child: ListView(
              padding: EdgeInsets.all(10),
              scrollDirection: Axis.horizontal,
              children: [
                listeElemani('assets/model1.jpeg', 'assets/chloelogo.png'),
                listeElemani('assets/model2.jpeg', 'assets/louisvuitton.jpg'),
                listeElemani('assets/model3.jpeg', 'assets/chanellogo.jpg'),
                listeElemani('assets/model1.jpeg', 'assets/chloelogo.png'),
                listeElemani('assets/model2.jpeg', 'assets/louisvuitton.jpg'),
                listeElemani('assets/model3.jpeg', 'assets/chanellogo.jpg'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Material(
              borderRadius: BorderRadius.circular(16),
              elevation: 4,
              child: Container(
                height: 500,
                width: double.infinity,
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/model1.jpeg',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Daisy",
                                style: GoogleFonts.montserrat(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "34 mins ago",
                                style: GoogleFonts.montserrat(
                                    fontSize: 12, color: Colors.grey),
                              ),
                              SizedBox(height: 15),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 173),
                          child: Icon(
                            Icons.more_vert,
                            color: Colors.grey,
                            size: 22,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      "This official website features a ribbed knit zipper jacket that is modern and stylish.It looks very temparament and is recommend to friends.",
                      style: GoogleFonts.montserrat(
                          fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              print("tıklandı");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Detay(
                                          imgPath: 'assets/modelgrid1.jpeg')));
                            },
                            child: Hero(
                              tag: 'assets/modelgrid1.jpeg',
                              child: Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.red,
                                  image: DecorationImage(
                                      image: AssetImage(
                                        "assets/modelgrid1.jpeg",
                                      ),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Detay(
                                              imgPath:
                                                  'assets/modelgrid2.jpeg')));
                                },
                                child: Hero(
                                  tag: "assets/modelgrid2.jpeg",
                                  child: Container(
                                    height: 95,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/modelgrid2.jpeg"),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Detay(
                                              imgPath:
                                                  'assets/modelgrid3.jpeg')));
                                },
                                child: Hero(
                                  tag: "assets/modelgrid3.jpeg",
                                  child: Container(
                                    height: 95,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/modelgrid3.jpeg"),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 25,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.brown.withOpacity(0.2),
                          ),
                          child: Text(
                            "# Louis vuitton",
                            style: GoogleFonts.montserrat(
                                fontSize: 10, color: Colors.brown),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          alignment: Alignment.center,
                          height: 25,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.brown.withOpacity(0.2),
                          ),
                          child: Text(
                            "# Chloe",
                            style: GoogleFonts.montserrat(
                                fontSize: 10, color: Colors.brown),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Divider(thickness: 2),
                    SizedBox(height: 20),
                    Expanded(
                      child: Row(
                        children: [
                          Icon(
                            Icons.reply,
                            color: Colors.brown.withOpacity(0.4),
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "1.7K",
                            style: GoogleFonts.montserrat(
                                fontSize: 14, fontWeight: FontWeight.w300),
                          ),
                          SizedBox(width: 25),
                          Icon(
                            Icons.comment,
                            color: Colors.brown.withOpacity(0.4),
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "325",
                            style: GoogleFonts.montserrat(
                                fontSize: 14, fontWeight: FontWeight.w300),
                          ),
                          Expanded(
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 30,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "2.3K",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  listeElemani(String imagePath, String logoPath) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(right: 10),
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(38),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            
            Positioned(
              top: 50,
              left: 50,
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: AssetImage(logoPath), fit: BoxFit.cover),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Container(
          height: 30,
          width: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.brown,
          ),
          child: Center(
            child: Text(
              "Follow",
              style: GoogleFonts.montserrat(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
