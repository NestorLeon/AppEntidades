import 'package:flutter/material.dart';

import '../../widgets/navigation_drawer_lista.dart';

class HomeListaScreen extends StatelessWidget {
  const HomeListaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estructura de datos: Arreglo / Lista'),
      ),
      drawer: const NavigationDrawerLista(),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
