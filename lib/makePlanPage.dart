/* makePlan 페이지 */
import 'package:flutter/material.dart';

class MakePlanPage extends StatefulWidget {
  const MakePlanPage({super.key});

  @override
  State<MakePlanPage> createState() => _MakePlanPageState();
}

class _MakePlanPageState extends State<MakePlanPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(foregroundColor: Colors.blueGrey,),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "당신의 계획을 작성해보세요!"
                ),
              ),
            ),
            Container(
              child: TextButton(
                child: Text("push"),
                onPressed: (){},
              ),
            )
          ],
        ),
      ),
    );
  }
}