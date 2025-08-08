import 'package:flutter/material.dart';
import 'package:login_app/widgets/DrawerMenu%20/drawer_menu.dart';
// import 'package:med_easy_app/src/database_manager.dart';
// import 'package:med_easy_app/src/widgets/DrawerMenu/drawer_menu.dart';
// import 'package:med_easy_app/src/widgets/Home/widget_info_blocks.dart';
// import 'package:med_easy_app/src/widgets/app_bar.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String totalAppointments = '0';
  late String totalTodayAppointments = '0';

  // _countAllAppointments() async {
  //   // final resultSet = await DatabaseProvider.db.getAppointmentsAll();
  //   setState(() {
  //     // totalAppointments = resultSet.toList().length.toString();
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
      //appBar: const MainAppBar(),
      drawer: const DrawerMenu(),
      body: Column(children: [
        Text(
          "Bernardo Amaral",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        //SizedBox(
        // child: infoTotalAppointmentsBlocks(context, totalAppointments)),
        //SizedBox(
        //child: infoTotalAppointmentsTodayBlocks(
        //  context, totalTodayAppointments))
      ]),
    );
  }
}
