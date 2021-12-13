import 'package:desafio03/modules/onboarding/screen/onboarding_screen.dart';
import 'package:desafio03/modules/tripdestiny/screens/tripdestiny_category_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("./assets/images/onboarding.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
                child: Text(
              'Vamos viajar?',
              style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontFamily: 'Arial',
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            )),
            Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 30),
              child: Text(
                  'Já já tudo isso passa e poderemos voltar a conhecer o mundo todo! Que tal planejar de agora os destinos mais badalados?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(40),
                padding: const EdgeInsets.all(20.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>

                        TripDestinyCategoryList(),
                  ),
                );
              },
              child: Text('Planejar destinos'.toUpperCase(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
