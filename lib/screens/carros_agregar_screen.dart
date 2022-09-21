import 'package:ejemplo_1/classes/ordenamiento.dart';
import 'package:ejemplo_1/screens/carros_lista_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../classes/carro.dart';

class AgregarCarroScreen extends StatelessWidget {
  final List<Carro> carros = [];

  AgregarCarroScreen({Key? key, required carros}) : super(key: key);

  final txtIDController = TextEditingController();
  final txtMarcaController = TextEditingController();
  final txtModeloController = TextEditingController();
  final txtColorController = TextEditingController();
  final txtCantidadDeLlantasController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agregar Carro"),
        //backgroundColor: Colors.amber,
      ),
      //backgroundColor: Colors.blueGrey,
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("ID"),
                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Ingrese el ID',
                      ),
                      controller: txtIDController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^(\d+)?\.?\d{0,2}')),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Color"),
                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Ingrese el Color',
                      ),
                      controller: txtColorController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Modelo"),
                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Ingrese el Modelo',
                      ),
                      controller: txtModeloController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Marca"),
                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Ingrese el Marca',
                      ),
                      controller: txtMarcaController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Cantidad de Llantas"),
                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Ingrese el Cantidad de Llantas',
                      ),
                      controller: txtCantidadDeLlantasController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: false),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'^(\d+)')),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: const ButtonStyle(
                    foregroundColor:
                        MaterialStatePropertyAll<Color>(Colors.white),
                  ),
                  onPressed: () {
                    Ordenamiento.add(
                      Carro(
                        cantidadDeLlantas:
                            int.parse(txtCantidadDeLlantasController.text),
                        marca: txtMarcaController.text,
                        modelo: txtModeloController.text,
                        color: txtColorController.text,
                        iD: double.parse(txtIDController.text),
                      ),
                    );
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => VerTodosScreen(
                          carros: Ordenamiento.miListaDeCarros,
                        ),
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text("Aceptar"),
                  ),
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                    foregroundColor:
                        MaterialStatePropertyAll<Color>(Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text("Cancelar"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
