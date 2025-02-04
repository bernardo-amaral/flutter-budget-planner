import 'package:flutter/material.dart';
import 'package:med_easy_app/routes.dart';
// import 'package:flutter_medical_app/src/config/route.dart';
// import 'package:flutter_medical_app/src/themes/light_color.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            //decoration: BoxDecoration(color: Color.fromARGB(255, 203, 114, 73)),
            accountName: Text(
              "Bernardo Amaral",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              "bernardo.amaral85@gmail.com",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              radius: 60.0,
              backgroundColor: Color(0xFF778899),
              backgroundImage: AssetImage('assets/user.jpg'),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
            ),
            title: const Text('Tela inicial'),
            onTap: () {
              Navigator.pushReplacementNamed(context, Routes.home);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.people,
            ),
            title: const Text('Adicionar paciente'),
            onTap: () {
              Navigator.pushReplacementNamed(context, Routes.patientsCreate);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.people,
            ),
            title: const Text('Pacientes'),
            onTap: () {
              Navigator.pushReplacementNamed(context, Routes.patientsList);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.schedule_sharp,
            ),
            title: const Text('Agenda'),
            onTap: () {
              Navigator.pushReplacementNamed(context, Routes.schedules);
            },
          ),
          const Divider(),
          const AboutListTile(
            icon: Icon(
              Icons.info,
            ),
            applicationIcon: Icon(
              Icons.local_play,
            ),
            applicationName: 'Medical App',
            applicationVersion: '1.0.22',
            applicationLegalese: '© 2023 Bernardo Amaral',
            aboutBoxChildren: [
              ///Content goes here...
            ],
            child: Text('About app'),
          ),
        ],
      ),
    );
  }
}
