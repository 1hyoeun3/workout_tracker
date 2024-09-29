import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_tracker/router/my_router.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: SafeArea(
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/runner.png'),
              fit: BoxFit.cover,
              opacity: 0.5,
            )),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      color: Colors.yellowAccent,
                      child: Text('남들이 그만둘 때, 난 계속한다',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontFamily: 'Bagel_Fat_One'))),
                  // Image(image: AssetImage('assets/runner.png')),
                  SizedBox(width: double.infinity),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Text('환영합니다',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(fontFamily: 'Bagel_Fat_One')),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              context.go('/workout_home');
                            },
                            child: Text('START',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(fontFamily: 'Bagel_Fat_One')),
                          ))
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
