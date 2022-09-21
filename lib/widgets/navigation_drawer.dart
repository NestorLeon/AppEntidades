import 'package:ejemplo_1/classes/ordenamiento.dart';
import 'package:ejemplo_1/screens/carros_agregar_screen.dart';
import 'package:ejemplo_1/screens/home_screen.dart';
import 'package:ejemplo_1/screens/carros_lista_screen.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Menu',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              leading: const Icon(Icons.home_filled),
              title: const Text('Home'),
              onTap: () => {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                )
              },
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              leading: const Icon(Icons.directions_car_filled),
              title: const Text('Lista de Carros'),
              onTap: () => {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => VerTodosScreen(
                      carros: Ordenamiento.miListaDeCarros,
                    ),
                  ),
                )
              },
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Agregar Carro'),
              onTap: () {
                // Close navigation drawer before
                Navigator.pop(context);

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AgregarCarroScreen(
                      carros: Ordenamiento.miListaDeCarros,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
