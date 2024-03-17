import 'package:flutter/material.dart';
import 'package:my_app/calendarPage.dart';
import 'package:my_app/menuPage.dart';
import 'package:my_app/challengePage.dart';
import 'package:my_app/todoPage.dart';


//todo:todoPage에서 할 일 영역 클릭 시 타이머 설정 기능 구현 & 창 닫아도 할 일 옆에 시간 보여주기 구현.

void main() async {
  /*
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: const FirebaseOptions(
    apiKey: "AIzaSyD1C8QaEAxv9QJIm2DDF9N3_b3UZv5o",
    appId: "1:270790104828:web:1da6b11a4729a7d79729",
    messagingSenderId: "2707901048",
    projectId: "todo-app-firebase-ce8",
  ),);
  */
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedIndex = 1; // 첫 화면을 CalendarPage로 설정.

  // 보여줄 페이지 리스트.
  final List<Widget> _navIndex = [
    TodoPage(),
    CalendarPage(),
    ChallengePage(),
  ];

  // 인덱스 변경 함수 정의.
  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 10,
        toolbarHeight: 75,
        backgroundColor: Color(0xffdcf2ff),
        foregroundColor: Colors.blueGrey,
        elevation: 1.0,
        //surfaceTintColor: Colors.blue,
        title: Text("Planner", style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Navigator.of(context).push(_createRouteOfMenuPage());
          },
        ),
      ),

      body: _navIndex.elementAt(_selectedIndex), //_navIndex의 메서드 elementAt을 사용해, _selectedIndex가 가리키는 숫자(인덱스)로 리스트 요소(페이지) 반환

      // 하단 네비게이션 바 정의
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted),
            label: 'Todo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.today_outlined),
            label: 'Calender',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.handshake_outlined),
            label: 'Challenge',
          ),
        ],
        selectedItemColor: Colors.blueGrey,
        currentIndex: _selectedIndex,
        onTap: _onNavTapped,

      ),
    );
  }
}



// 페이지 라우터 생성 함수 (메뉴 페이지)
Route _createRouteOfMenuPage() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const MenuPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-1.0, 0.0);
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



