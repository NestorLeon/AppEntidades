import 'package:flutter/material.dart';
import 'package:ejemplo_1/widgets/navigation_drawer_tabla_hash.dart';

class HomeTablaHashScreen extends StatelessWidget {
  const HomeTablaHashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Estructura de datos: Tabla Hash / Diccionario / Mapa'),
      ),
      drawer: const NavigationDrawerTablaHash(),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
