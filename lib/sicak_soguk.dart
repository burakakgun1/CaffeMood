import 'dart:math';
import 'package:caffemood/kahve_tarif_page.dart';
import 'package:flutter/material.dart';

class KahveTarifi {
  final String tarifAdi;
  final String tarifMalzemeler;
  final String tarifHazirlanis;
  final String resimPath;
  final String youtubeUrl;
  final String spotifyUrl;
  final double tatlikDerecesi;

  KahveTarifi(this.tarifAdi, this.tarifMalzemeler, this.tarifHazirlanis,
      this.resimPath, this.youtubeUrl, this.spotifyUrl,this.tatlikDerecesi);
}

class Sicak extends StatelessWidget {
  final List<KahveTarifi> sicakTarifler = [
    KahveTarifi('Türk Kahvesi', 'Türk Kahvesi', 'a', 'assets/turk-kahvesi.jpg',
        'https://www.example.com/soguk-tarif-2-playlist','a', 1),
    KahveTarifi(
        'Caramel Mocha',
        'Caramel Mocha İçeriği',
        'a',
        'assets/caramel-mocha.jpg',
        'https://www.example.com/soguk-tarif-2-playlist','a',
        1),
    KahveTarifi('Espresso', 'Espresso İçeriği', 'a', 'assets/espresso.jpg',
        'https://www.example.com/soguk-tarif-2-playlist','a', 1),
    KahveTarifi(
        'Flat White',
        'Flat White İçeriği',
        'a',
        'assets/flat-white.jpg',
        'https://www.example.com/soguk-tarif-2-playlist','a',
        2),
    KahveTarifi('Latte', "Latte İçeriği", 'a', 'assets/latte.jpg',
        'https://www.example.com/soguk-tarif-2-playlist', 'a',5),
    KahveTarifi('Mocha', 'Mocha İçeriği', 'a', 'assets/mocha.jpg',
        'https://www.example.com/soguk-tarif-2-playlist', 'a',3),
    KahveTarifi('Filtre Kahve', 'Filtre Kahve', 'a', 'assets/filtre-kahve.jpg',
        'https://www.example.com/soguk-tarif-2-playlist', 'a',1),
    KahveTarifi('Americano', 'Americano', 'a', 'assets/americano.jpg',
        'https://www.example.com/soguk-tarif-2-playlist','a', 5),
    KahveTarifi('Cappucino', 'Cappucino', 'a', 'assets/cappucino.jpg',
        'https://www.example.com/soguk-tarif-2-playlist','a', 1),
    KahveTarifi('Pumpkin Spice', 'Pumpkin Spice', 'a', 'assets/pumpkin.jpg',
        'https://www.example.com/soguk-tarif-2-playlist','a', 1),
  ];

  Sicak({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 109, 66, 49),
      appBar: AppBar(
        title: Text('SICAK KAHVE'),
        backgroundColor: const Color.fromARGB(255, 109, 66, 49),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.coffee_maker_outlined),
              onPressed: () {
                final random = Random();
                final randomIndex = random.nextInt(sicakTarifler.length);
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) =>
                        KahveTarifiSayfasi(sicakTarifler[randomIndex]),
                    transitionsBuilder: (_, animation, __, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );
              }),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: calculateCrossAxisCount(context),
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: sicakTarifler.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) =>
                      KahveTarifiSayfasi(sicakTarifler[index]),
                  transitionsBuilder: (_, animation, __, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),
              );
            },
            onLongPress: () {
              showTatlikDerecesiDialog(
                  context,
                  sicakTarifler[index].tatlikDerecesi,
                  sicakTarifler[index].resimPath);
            },
            child: Ink.image(
              image: AssetImage(sicakTarifler[index].resimPath),
              fit: BoxFit.contain,
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(7.0),
                        child: Image.asset(
                          sicakTarifler[index].resimPath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    sicakTarifler[index].tarifAdi,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void showTatlikDerecesiDialog(
      BuildContext context, double tatlikDerecesi, String kahveResimPath) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            double widthFactor = tatlikDerecesi / 5;
            return AlertDialog(
              title: Column(
                children: [
                  Image.asset(
                    kahveResimPath,
                    height: 200,
                    width: 200,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    "Tatlık Derecesi: $tatlikDerecesi",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 33, 35, 37),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: (widthFactor * 100).toInt(),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 160, 125, 79),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: (100 - widthFactor * 100).toInt(),
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              backgroundColor:
                  const Color.fromARGB(255, 255, 255, 255).withOpacity(0.7),
            );
          },
        );
      },
    );
  }

  int calculateCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double desiredItemWidth = 150.0;
    int crossAxisCount = (screenWidth / desiredItemWidth).floor();
    return crossAxisCount > 1 ? crossAxisCount : 1;
  }
}

class Soguk extends StatelessWidget {
  final List<KahveTarifi> sogukTarifler = [
    KahveTarifi(
        'Ice Americano',
        'Ice Americano İçeriği',
        'a',
        'assets/ice-americano.jpg',
        'https://www.example.com/soguk-tarif-2-playlist','a',
        5),
    KahveTarifi(
        'Ice Latte',
        '''
•	1 shot espresso
•	Köpürtülmüş süt
•	Buz 
''',
        '''1.	Hazırladığınız espressoyu bardağınıza boşaltın.
2.	Bardağınızın yarısını geçecek kadar köpürtülmüş süt ekleyin ve karıştırın.
3.	Bardağınızın kalan kısmını buzla doldurun.''',
        'assets/ice-latte.jpg',
        'https://www.example.com/soguk-tarif-2-playlist','a',
        3),
    KahveTarifi('Ice Mocha', 'Ice Mocha İçeriği', 'a', 'assets/ice-mocha.jpg',
        'https://www.example.com/soguk-tarif-2-playlist', 'a',2),
    KahveTarifi(
        'Ice Caramel Macchiato',
        '''Ice Caramel Macchiato''',
        'a',
        'assets/ICED-CARAMEL-MACCHIATO.jpg',
        'https://www.example.com/soguk-tarif-2-playlist','a',
        1),
    KahveTarifi(
        'Ice Caramel Latte',
        'Ice Caramel Latte',
        'a',
        'assets/CARAMEL-ICED-LATTE.jpg',
        'https://www.example.com/soguk-tarif-2-playlist','a',
        1),
    KahveTarifi(
        'Iced White Chocolate Mocha',
        'Iced White Chocolate Mocha',
        'a',
        'assets/ICED-WHİTE-CHOCOLATE-MOCHA.jpg',
        'https://www.example.com/soguk-tarif-2-playlist','a',
        1),
    KahveTarifi(
        'Naneli Espresso',
        'Naneli espresso',
        'a',
        'assets/naneli-espresso.jpg',
        'https://www.example.com/soguk-tarif-2-playlist','a',
        1),
    KahveTarifi(
        'Tarçınlı Soğuk Kahve',
        'Tarçınlı Soğuk Kahve',
        'a',
        'assets/Tarcınlı.jpg',
        'https://www.example.com/soguk-tarif-2-playlist','a',
        1),
    KahveTarifi('Vietnam Kahvesi', 'Vietnam Kahvesi', 'a', 'assets/VIETNAM.jpg',
        'https://www.example.com/soguk-tarif-2-playlist','a', 1),
    KahveTarifi(
        'Vanilla Cold Brew',
        'Vanilla Cold Brew',
        'a',
        'assets/VANILLA-COLD-BREW.jpg',
        'https://www.example.com/soguk-tarif-2-playlist','a',
        1),
    // Diğer soğuk tarifler...
  ];

  Soguk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 109, 66, 49),
      appBar: AppBar(
        title: Text('SOĞUK KAHVE'),
        backgroundColor: const Color.fromARGB(255, 109, 66, 49),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.coffee_maker_outlined),
            onPressed: () {
              final random = Random();
              final randomIndex = random.nextInt(sogukTarifler.length);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      KahveTarifiSayfasi(sogukTarifler[randomIndex]),
                ),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: calculateCrossAxisCount(context),
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: sogukTarifler.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) =>
                      KahveTarifiSayfasi(sogukTarifler[index]),
                  transitionsBuilder: (_, animation, __, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),
              );
            },
            onLongPress: () {
              showTatlikDerecesiDialog(
                  context,
                  sogukTarifler[index].tatlikDerecesi,
                  sogukTarifler[index].resimPath);
            },
            child: Ink.image(
              image: AssetImage(sogukTarifler[index].resimPath),
              fit: BoxFit.contain,
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(7.0),
                        child: Image.asset(
                          sogukTarifler[index].resimPath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    sogukTarifler[index].tarifAdi,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void showTatlikDerecesiDialog(
      BuildContext context, double tatlikDerecesi, String kahveResimPath) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            double widthFactor = tatlikDerecesi / 5;
            return AlertDialog(
              title: Column(
                children: [
                  Image.asset(
                    kahveResimPath,
                    height: 200,
                    width: 200,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    "Tatlık Derecesi: $tatlikDerecesi",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 33, 35, 37),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: (widthFactor * 100).toInt(),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 160, 125, 79),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: (100 - widthFactor * 100).toInt(),
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              backgroundColor:
                  const Color.fromARGB(255, 255, 255, 255).withOpacity(0.7),
            );
          },
        );
      },
    );
  }

  int calculateCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double desiredItemWidth = 150.0;
    int crossAxisCount = (screenWidth / desiredItemWidth).floor();
    return crossAxisCount > 1 ? crossAxisCount : 1;
  }
}