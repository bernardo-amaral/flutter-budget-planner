import 'package:flutter/material.dart';
import 'package:login_app/config/routes.dart';
import 'package:login_app/model/condominium.dart';
import 'package:login_app/services/api_service.dart';
import 'package:login_app/widgets/AppBar/app_bar.dart';
import 'package:login_app/widgets/DrawerMenu/drawer_menu.dart';
import 'package:login_app/widgets/home_blocks.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  static const String routeName = '/';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String totalApartments = '20';

  Future<List<Condominium>> _fetchCondominiums() async {
    final url = ApiService.endpoint("/condominiums");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Condominium.fromJson(item)).toList();
    } else {
      throw Exception("Erro ao listar edifícios");
    }
  }

  Future<List> _fetchCondominiumsData(uuid) async {
    final url = ApiService.endpoint("/condominiums/$uuid");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Condominium.fromJson(item)).toList();
    } else {
      throw Exception("Erro ao buscar dados do condomínio");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      drawer: const DrawerMenu(),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: DropdownSearch<Condominium>(
              items: (filter, cs) => _fetchCondominiums(),
              popupProps: const PopupProps.menu(
                fit: FlexFit.loose,
              ),
              decoratorProps: const DropDownDecoratorProps(
                decoration: InputDecoration(
                  labelText: "Selecione o edifício",
                  border: OutlineInputBorder(),
                ),
              ),
              itemAsString: (Condominium c) => c.description,
              compareFn: (Condominium a, Condominium b) => a.uuid == b.uuid,
              onChanged: (Condominium? value) {
                if (value != null) {
                  _fetchCondominiumsData(value.uuid).then((data) {
                    setState(() {
                      totalApartments =
                          data.isNotEmpty ? data[0].totalApartments : '0';
                    });
                  }).catchError((error) {
                    debugPrint("Erro ao buscar dados do condomínio: $error");
                  });

                  debugPrint(
                      "Selecionado: ${value.uuid} - ${value.description}");
                }
              },
            ),
          ),
          SizedBox(
            child: actionInformationBlock(
              context,
              totalApartments,
              Routes.apartmentsList,
            ),
          ),
        ],
      ),
    );
  }
}
