// PopCalendarPage
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class PopCalendarPage extends StatefulWidget {
  const PopCalendarPage({super.key});

  @override
  State<PopCalendarPage> createState() => _PopCalendarPageState();
}

class _PopCalendarPageState extends State<PopCalendarPage> {

  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(foregroundColor: Colors.blueGrey),
      body: TableCalendar(
        // 캘린더에서 날짜가 선택될 때 이벤트
        onDaySelected: onDaySelected,

        // 특정 날짜가 선택된 날짜와 동일 한지 여부 판단
        selectedDayPredicate: (date) {
          return isSameDay(selectedDate, date);
        },

        focusedDay: DateTime.now(),
        firstDay: DateTime(2020),
        lastDay: DateTime(2030),

        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
        ),

        calendarStyle: CalendarStyle(),//ToDo: 캘린터 스타일 새로 작성해보자. 너무 구짐.
      ),


    );
  }

  // 달력에서 날짜가 선택 되었을 때 호출 되는 콜백 함수
  void onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    setState(() {
      this.selectedDate = selectedDate;
    });
  }
}