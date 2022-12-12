import 'package:flutter/material.dart';
import '../services/mockapi.dart';

class Caja3 extends StatefulWidget {
  const Caja3({super.key});

  @override
  State<StatefulWidget> createState() => Caja3State();
}

class Caja3State extends State<Caja3> {
  int tiempo = 0;
  int titulo = 0;
  double tamanio = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        FloatingActionButton(
          backgroundColor: Colors.red,
          foregroundColor: Colors.black,
          onPressed: () async {
            setState(() {
              tiempo = 10;
              tamanio = 200.0;
            });

            var tituloRes = await MockApi().getFisherPriceInteger();

            setState(() {
              tiempo = 0;
              titulo = tituloRes;
              tamanio = 0;
            });
          },
          child: const Icon(Icons.directions_run),
        ),
        const Divider(
          height: 5,
          color: Colors.transparent,
        ),
        AnimatedContainer(
          width: tamanio,
          height: 10,
          color: Colors.red,
          duration: Duration(seconds: tiempo),
          curve: Curves.fastOutSlowIn,
        ),
        Text(titulo.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 55,
              color: Colors.red,
            )),
      ],
    ));
  }
}
