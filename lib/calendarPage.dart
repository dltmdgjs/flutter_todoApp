// CalendarPage
import "package:flutter/material.dart";
import 'package:my_app/makePlanPage.dart';
import 'package:my_app/popCalendarPage.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("하단의 버튼을 클릭해 원하는 날짜에 계획을 세워보세요"),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: const Text("make plan"),
                onPressed: (){
                  Navigator.push(context, _createRouteOfMakePlan());
                },
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                child: const Text("show calendar"),
                onPressed: () {
                  Navigator.push(context, _createRouteOfPopCalendar());
                },
              ),
            ],
          )
      ),
    );
  }
}




// 페이지 라우터 생성 함수 (makePlan)
Route _createRouteOfMakePlan() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const MakePlanPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}


// 페이지 라우터 생성 함수 (캘린더)
Route _createRouteOfPopCalendar() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const PopCalendarPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

