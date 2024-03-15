// TodoPage
import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {

  late List<bool> _isChecked;
  List<String> todoList = ['청소하기', '학교가기', '도서관 가서 공부하기', 'a','b','c','d','e','f','g'];

  @override
  void initState() {
    super.initState();
    _isChecked = List<bool>.filled(todoList.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  height: 50,
                  child: const Center(
                      child: Text(
                        "Today's todoList",
                        style: TextStyle(fontSize: 15),
                      )
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(
                          color: Color(0xffeceff1),
                          blurRadius:5.0,
                          spreadRadius: 3.0,
                        )],
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white54
                    ),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return CheckboxListTile(
                          title: Text(todoList[index]),
                          subtitle: Text('메모: '),
                          activeColor: Colors.blueGrey,
                          checkColor: Colors.white,
                          controlAffinity: ListTileControlAffinity.platform,
                          value: _isChecked[index],
                          side: BorderSide(color: Colors.blueGrey, width: 1.5),
                          onChanged: (value) {
                            setState(() {
                              _isChecked[index] = value!;
                            });
                          },
                        );
                      },
                      itemCount: todoList.length,
                      //separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.grey, thickness: 0.3,),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
