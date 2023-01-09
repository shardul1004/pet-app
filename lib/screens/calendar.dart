import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:buddy/colors/colors.dart';
import 'package:flutter/services.dart';

import 'package:intl/date_symbol_data_local.dart';
import 'package:buddy/utils/Event.dart';
import 'package:table_calendar/table_calendar.dart';

class calendarPage extends StatefulWidget {
  const calendarPage({Key? key}) : super(key: key);

  @override
  State<calendarPage> createState() => _calendarPageState();
}

class _calendarPageState extends State<calendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  Map<DateTime?, List<Event>>? selectedEvents;
  TextEditingController _controller = TextEditingController();
  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();
  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }
  int callfunc(DateTime day){
    List<Event> list = _getEventsfromDay(day);
    return list.length;
  }

  String showtext(DateTime date,int i){
    List<Event> list = _getEventsfromDay(date);
    return list[i].toString();
  }
  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents![date] ?? [];
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        backgroundColor: appColor.background,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: appColor.barcolor,
          leading: Icon(
            Icons.bookmark_border_outlined,
            size: 35,
            color: appColor.iconColor,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.shopping_cart,
                size: 35,
                color: appColor.iconColor,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // text-field
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: appColor.barcolor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    )),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: SizedBox(
                        width: ((MediaQuery.of(context).size.width) - 60),
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: Icon(
                                Icons.search,
                                color: appColor.iconColor,
                              ),
                              hintText: "Search...",
                              contentPadding: EdgeInsets.only(top: 15, left: 15),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(25.7),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              // Choose date
              Padding(
                padding: const EdgeInsets.only(left: 22.0),
                child: Text(
                  "Choose dates",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
                ),
              ),
              Stack(children: [
                Container(
                  child: Container(
                    height: 370,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TableCalendar(
                            firstDay: DateTime.utc(2010, 10, 16),
                            lastDay: DateTime.utc(2030, 3, 14),
                            focusedDay: _focusedDay,
                            calendarFormat: _calendarFormat,
                            calendarStyle: CalendarStyle(
                              selectedDecoration: BoxDecoration(
                                color: appColor.buttoncolor,
                                shape: BoxShape.circle,
                              ),
                              todayDecoration: BoxDecoration(
                                  color: appColor.buttoncolor,
                                  shape: BoxShape.circle),
                            ),
                            selectedDayPredicate: (currentselectedDate) {
                              return isSameDay(_selectedDay, currentselectedDate);
                            },
                            onPageChanged: (focusedDay) {
                              // No need to call `setState()` here
                              _focusedDay = focusedDay;
                            },
                            onDaySelected: (selectedDay, focusedDay) {
                              if (!isSameDay(_selectedDay, selectedDay)) {
                                setState(() {
                                  _selectedDay = selectedDay;
                                  _focusedDay = focusedDay;
                                });
                              }
                            },
                            onFormatChanged: (format) {
                              if (format != _calendarFormat) {
                                setState(() {
                                  _calendarFormat = format;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 50.0, top: 350),
                      child: Container(
                        decoration: BoxDecoration(
                            color: appColor.buttoncolor, shape: BoxShape.circle),
                        child: IconButton(
                            onPressed: () => showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                      title: Text("Add Event"),
                                      content: TextFormField(
                                        controller: _controller,
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () => Navigator.pop(_),
                                            child: Text("Cancel")),
                                        TextButton(
                                            onPressed: () {
                                              if (_controller.text.isEmpty){
                                                print(selectedEvents![_selectedDay]);
                                              }else{
                                                if(selectedEvents![_selectedDay] != null){
                                                  selectedEvents![_selectedDay]?.add(
                                                    Event(title: _controller.text),
                                                  );
                                                }else{
                                                  selectedEvents![_selectedDay] = [
                                                    Event(title: _controller.text)
                                                  ];

                                                }
                                              }

                                              Navigator.pop(_);
                                              _controller.clear();
                                              setState(() {
                                                return;
                                              });
                                            }
                                            , child: Text("Ok"))
                                      ],
                                    )),
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            )),
                      ),
                    ))
              ]),
              Container(
                height: 220,
                decoration: BoxDecoration(

                ),
                child: Expanded(
                  child: ListView.builder(
                      itemCount: callfunc(_focusedDay),
                      shrinkWrap: true,

                      itemBuilder: (BuildContext context, int index) => Padding(
                    padding: const EdgeInsets.only(left:12.0, right: 12.0, top: 20.0),
                          child: Container(
                              height: 110,
                              decoration: BoxDecoration(
                              color: Colors.white,
                                  borderRadius: BorderRadius.circular(25)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(showtext(_focusedDay,index),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w300,

                        ),),
                      )
                    ),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
