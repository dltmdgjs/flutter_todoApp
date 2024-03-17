// ShopPage
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  const ChallengePage({super.key});

  @override
  State<ChallengePage> createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {

  List<String> challengeList = ['challenge 1', 'challenge 2', 'challenge 3'];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 3,
              crossAxisSpacing: 3,
            ),
            itemCount: challengeList.length,
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueGrey,
              ),
              width: 100,
              height: 100,
              child: Center(
                  child: Text(challengeList[index])
              ),
            ),
          )
      ),
    );
  }
}
