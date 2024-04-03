import 'package:flutter/material.dart';
import 'home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.6,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 74, 137, 195),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(70),
                ),
              ),
              child: Center(
                child: Image.asset(
                  "images/books.png",
                  scale: 0.8,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.666,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 74, 137, 195),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView( // Wrap with SingleChildScrollView
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.666,
                  padding: EdgeInsets.only(top: 40, bottom: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(70),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Добро Пожаловать!",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          wordSpacing: 2,
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "ИНФОРМАЦИОННАЯ СИСТЕМА «ГОСУДАРСТВЕННОЕ ПЛАНИРОВАНИЕ»(БЮДЖЕТНОЕ ПЛАНИРОВАНИb)",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Material(
                        color: const Color(0xFF674AEF),
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 1,
                              horizontal: 40, // Adjusted width
                            ),
                            child: Text(
                              "Дальше",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
