import 'package:flutter/material.dart';
import '../services/mockapi.dart';

class Caja1 extends StatefulWidget {
  const Caja1({super.key});

  @override
  State<StatefulWidget> createState() => Caja1State();
}

class Caja1State extends State<Caja1> {
  int tiempo = 0;
  int titulo = 0;
  double tamanio = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        FloatingActionButton(
          backgroundColor: Colors.green,
          foregroundColor: Colors.black,
          onPressed: () async {
            setState(() {
              tiempo = 1;
              tamanio = 200.0;
            });

            var tituloRes = await MockApi().getFerrariInteger();

            setState(() {
              tiempo = 0;
              titulo = tituloRes;
              tamanio = 0;
            });
          },
          child: const Icon(Icons.flash_on),
        ),
        const Divider(
          height: 5,
          color: Colors.transparent,
        ),
        AnimatedContainer(
          width: tamanio,
          height: 10,
          color: Colors.green,
          duration: Duration(seconds: tiempo),
          curve: Curves.fastOutSlowIn,
        ),
        Text(titulo.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 55,
              color: Colors.green,
            )),
      ],
    ));
  }
}
