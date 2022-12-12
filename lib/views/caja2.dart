import 'package:flutter/material.dart';
import '../services/mockapi.dart';

class Caja2 extends StatefulWidget {
  const Caja2({super.key});

  @override
  State<StatefulWidget> createState() => Caja2State();
}

class Caja2State extends State<Caja2> {
  int tiempo = 0;
  int titulo = 0;
  double tamanio = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        FloatingActionButton(
          backgroundColor: Colors.yellow,
          foregroundColor: Colors.black,
          onPressed: () async {
            setState(() {
              tiempo = 3;
              tamanio = 200.0;
            });

            var tituloRes = await MockApi().getHyundaiInteger();

            setState(() {
              tiempo = 0;
              titulo = tituloRes;
              tamanio = 0;
            });
          },
          child: const Icon(Icons.airport_shuttle),
        ),
        const Divider(
          height: 5,
          color: Colors.transparent,
        ),
        AnimatedContainer(
          width: tamanio,
          height: 10,
          color: Colors.yellow,
          duration: Duration(seconds: tiempo),
          curve: Curves.fastOutSlowIn,
        ),
        Text(titulo.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 55,
              color: Colors.yellow,
            )),
      ],
    ));
  }
}
