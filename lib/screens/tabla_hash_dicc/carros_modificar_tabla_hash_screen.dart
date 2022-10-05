import 'package:ejemplo_1/classes/ordenamiento_tabla_hash.dart';
import 'package:ejemplo_1/screens/tabla_hash_dicc/carros_tabla_hash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../classes/carro.dart';
import 'package:ejemplo_1/classes/ordenamiento_arreglo_lista.dart';

class ModificarCarroTablaHashScreen extends StatelessWidget {
  Carro _carro = Carro(iD: 0);

  ModificarCarroTablaHashScreen({Key? key, required Carro carro})
      : super(key: key) {
    _carro = carro;
    txtIDController.text = carro.iD.toString();
    txtColorController.text = carro.color;
    txtMarcaController.text = carro.marca;
    txtCantidadDeLlantasController.text = carro.cantidadDeLlantas.toString();
    txtModeloController.text = carro.modelo;
  }

  final txtIDController = TextEditingController();
  final txtMarcaController = TextEditingController();
  final txtModeloController = TextEditingController();
  final txtColorController = TextEditingController();
  final txtCantidadDeLlantasController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modificar Carro"),
        //backgroundColor: Colors.amber,
      ),
      //backgroundColor: Colors.blueGrey,
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: ListView(
              padding: const EdgeInsets.all(20.0),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
                    OrdenamientoLista.modify(
                      _carro,
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
                        builder: (context) => VerTodosTablaHashScreen(
                          carros: OrdenamientoTablaHash.miTablaHashDeCarros,
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
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => VerTodosTablaHashScreen(
                          carros: OrdenamientoTablaHash.miTablaHashDeCarros,
                        ),
                      ),
                    );
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
