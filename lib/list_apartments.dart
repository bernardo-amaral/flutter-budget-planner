import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:login_app/widgets/AppBar/app_bar.dart';
import 'package:login_app/widgets/DrawerMenu/drawer_menu.dart';

class ApartmentsListPage extends StatefulWidget {
  static const String routeName = '/apartments/list';

  const ApartmentsListPage({super.key});

  @override
  State<ApartmentsListPage> createState() => _PatientsListPageState();
}

class _PatientsListPageState extends State<ApartmentsListPage> {
  bool isLoading = false;
  final String patientDefault = 'assets/patient_default.png';
  var logger = Logger();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<List> _getPatients() async {
    final resultSet = []; // await DatabaseProvider.db.getApartments();
    return resultSet.toList();
  }

  Widget _patientRow(apartment) {
    return Card(
      color: Colors.white,
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 4.0),
      child: ListTile(
        // onTap: () {
        //   Navigator.of(context).push(MaterialPageRoute(
        //       builder: (context) => PatientDetailPage(patient: patient)));
        // },
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        leading: Container(
            padding: const EdgeInsets.only(right: 10.0),
            decoration: const BoxDecoration(
                border: Border(
                    right: BorderSide(width: 1.0, color: Colors.white24))),
            child: apartment.patientPhoto != ''
                ? Image.network(apartment.patientPhoto)
                : Image.asset(patientDefault)),
        title: Text(
          apartment.name,
          style: const TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
            // ignore: unnecessary_null_comparison
            apartment.lastAppointment != null
                // ignore: prefer_interpolation_to_compose_strings
                ? 'Última consulta: ' + apartment.lastAppointment
                : 'Novo apartamento',
            style: TextStyle(
                color:
                    // ignore: unnecessary_null_comparison
                    apartment.lastAppointment != null
                        ? Colors.black
                        : Colors.red,
                fontSize: 10.0)),
      ),
    );
  }

  Widget _patientsList() {
    return FutureBuilder<List>(
      future: _getPatients(),
      builder: (context, snapshot) {
        if (snapshot.data!.isEmpty && isLoading) {
          isLoading = false;
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.data!.isEmpty) {
          return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Text('Nenhum apartamento cadastrado'));
        }

        return ListView(
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          controller: ScrollController(),
          padding: const EdgeInsets.only(bottom: 90),
          children: snapshot.data!
              .map((patient) {
                return _patientRow(patient);
              })
              // ignore: unnecessary_null_comparison
              .where((w) => w != null)
              .toList(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      drawer: const DrawerMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _patientsList(),
          ],
        ),
      ),
    );
  }
}
