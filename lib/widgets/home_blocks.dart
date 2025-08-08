import 'package:flutter/material.dart';

Widget actionInformationBlock(BuildContext context, String totalApartments) {
  return GestureDetector(
    onTap: () => Navigator.pushReplacementNamed(context, '/'),
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.only(left: 30, top: 10, bottom: 10, right: 30), 
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.indigo[300],
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.apartment,
                size: 50.0,
                color: Colors.white,
              ),
              const SizedBox(width: 10),
              Text(
                'Medições pendentes'.toUpperCase(),
                style: const TextStyle(fontSize: 18, color: Colors.white),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 5),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    totalApartments,
                    style: const TextStyle(fontSize: 36, color: Colors.white),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
