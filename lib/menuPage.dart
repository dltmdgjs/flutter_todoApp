import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<String> entries = [
    '공지사항',
    '고객센터',
    '사용설명서',
    '앱 평가하기'
  ];
  // todo:위 entries에 맞는 url, 또는 페이지 리스트 추가하기.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.blueGrey,
          toolbarHeight: 75,
        ),
        body: ListView.separated(
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: (){},
                    child: Text(
                        entries[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        )
                    ),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(
            height: 10.0,
            color: Colors.grey,
          ),
        )
    );
  }
}
