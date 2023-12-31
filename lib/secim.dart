import 'package:caffemood/sicak_soguk.dart';
import 'package:flutter/material.dart';

class Secim extends StatelessWidget {
  const Secim({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF997A5B),
      body: Column(
        children: <Widget>[
          Expanded(
            child: InkWell(
              highlightColor:
                  Color.fromARGB(206, 255, 255, 255).withOpacity(0.3),
              splashColor: Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => Soguk(),
                    transitionsBuilder: (_, animation, __, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: Ink.image(
                width: double.infinity,
                image: AssetImage("assets/soguk.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              highlightColor:
                  Color.fromARGB(206, 255, 255, 255).withOpacity(0.3),
              splashColor: Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => Sicak(),
                    transitionsBuilder: (_, animation, __, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: Ink.image(
                width: double.infinity,
                image: AssetImage("assets/sicak.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
