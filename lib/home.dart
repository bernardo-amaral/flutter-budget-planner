import 'package:flutter/material.dart';
import 'package:login_app/widgets/AppBar/app_bar.dart';
import 'package:login_app/widgets/DrawerMenu/drawer_menu.dart';
import 'package:login_app/widgets/home_blocks.dart';
import 'package:dropdown_search/dropdown_search.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String totalApartments = '20';
  late String totalTodayAppointments = '0';

  // _countAllAppointments() async {
  //   // final resultSet = await DatabaseProvider.db.getAppointmentsAll();
  //   setState(() {
  //     // totalApartments = resultSet.toList().length.toString();
  //   });
  // }

  // _countTodayAppointments() async {
  //   // final resultSet = await DatabaseProvider.db.getAppointmentsToday();
  //   setState(() {
  //     //totalTodayAppointments = resultSet.toList().length.toString();
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // _countAllAppointments();
    //_countTodayAppointments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      drawer: const DrawerMenu(),
      body: Column(children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: DropdownSearch<String>(
            items: (f, cs) => ['Edifício Premier'],
            popupProps: PopupProps.menu(
                disabledItemFn: (item) => item == 'Item 3', fit: FlexFit.loose),
          ),
        ),
        SizedBox(child: actionInformationBlock(context, totalApartments)),
      ]),
    );
  }
}
