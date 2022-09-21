import 'package:ejemplo_1/screens/carros_agregar_screen.dart';
import 'package:ejemplo_1/screens/carros_modificar_screen.dart';
import 'package:flutter/material.dart';

import 'package:ejemplo_1/classes/carro.dart';
import 'package:ejemplo_1/classes/ordenamiento.dart';
import 'package:ejemplo_1/widgets/navigation_drawer.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class VerTodosScreen extends StatefulWidget {
  List<Carro> carros = [];

  VerTodosScreen({Key? key, required this.carros}) : super(key: key);

  @override
  State<VerTodosScreen> createState() => _VerTodosScreenState();
}

class _VerTodosScreenState extends State<VerTodosScreen> {
  //List<Carro> carros = [];

  void onEdit(BuildContext context, int index) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ModificarCarroScreen(
          carro: widget.carros[index],
        ),
      ),
    );
  }

  void onDelete(BuildContext context, int index) async {
    var state = Slidable.of(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    bool? dismiss = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Eliminar'),
          content: const Text('¿Está seguro de eliminar el elemento?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Si'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );

    if (dismiss != null && state != null) {
      if (dismiss) {
        if (scaffoldMessenger.mounted) {
          scaffoldMessenger.showSnackBar((SnackBar(
            content: Text(
                'Se eliminó el elemento ${widget.carros[index].marca}-${widget.carros[index].modelo}'),
            duration: const Duration(seconds: 2),
          )));
        }
        setState(() {
          widget.carros.removeAt(index);
        });
      }
    }
  }

  void _showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar((SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 2),
    )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AgregarCarroScreen(
                carros: Ordenamiento.miListaDeCarros,
              ),
            ),
          );
        },
        child: const Icon(Icons.add_outlined),
      ),
      drawer: const NavigationDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            /* leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
            ), */
            title: const Text('Ver Todos'),
            actions: [
              PopupMenuButton(
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem<int>(
                      value: 0,
                      child: Text('Ordenar por Marca'),
                    ),
                    const PopupMenuItem<int>(
                      value: 1,
                      child: Text('Ordenar por Modelo'),
                    ),
                    const PopupMenuItem<int>(
                      value: 2,
                      child: Text('Ordenar por Color'),
                    ),
                    const PopupMenuItem<int>(
                      value: 3,
                      child: Text('Ordenar por ID'),
                    ),
                  ];
                },
                onSelected: (value) {
                  switch (value) {
                    case 0:
                      Ordenamiento.porMarca();
                      break;
                    case 1:
                      Ordenamiento.porModelo();
                      break;
                    case 2:
                      Ordenamiento.porColor();
                      break;
                    case 3:
                      Ordenamiento.porID();
                      break;
                  }
                  setState(() {
                    widget.carros = Ordenamiento.miListaDeCarros;
                  });
                },
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: widget.carros.length,
              (context, index) {
                return GestureDetector(
                  onTap: () {
                    onEdit(context, index);
                  },
                  child: Slidable(
                    key: Key(widget.carros[index].iD.toString()),

                    // The start action pane is the one at the left or the top side.
                    startActionPane: ActionPane(
                      // A motion is a widget used to control how the pane animates.
                      motion: const DrawerMotion(),

                      // All actions are defined in the children parameter.
                      children: [
                        // A SlidableAction can have an icon and/or a label.
                        SlidableAction(
                          onPressed: (context) {
                            onEdit(context, index);
                          },
                          backgroundColor: const Color(0xFF21B7CA),
                          foregroundColor: Colors.white,
                          icon: Icons.edit_outlined,
                          label: 'Modificar',
                        ),
                      ],
                    ),

                    // The end action pane is the one at the right or the bottom side.
                    endActionPane: ActionPane(
                      extentRatio: 0.5,
                      motion: const ScrollMotion(),
                      dismissible: DismissiblePane(
                        onDismissed: () {
                          _showSnackBar(
                            context,
                            'Se eliminó el elemento ${widget.carros[index].marca}-${widget.carros[index].modelo}',
                          );
                          setState(() {
                            Ordenamiento.delete(widget.carros[index]);
                            //widget.carros.removeAt(index);
                          });
                        },
                        closeOnCancel: true,
                        confirmDismiss: () async {
                          return await showDialog<bool>(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Eliminar'),
                                    content: const Text(
                                        '¿Está seguro de eliminar el elemento?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(true);
                                        },
                                        child: const Text('Si'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(false);
                                        },
                                        child: const Text('No'),
                                      ),
                                    ],
                                  );
                                },
                              ) ??
                              false;
                        },
                      ),
                      children: [
                        SlidableAction(
                          onPressed: (context) async {
                            onDelete(context, index);
                          },
                          backgroundColor: const Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete_outline,
                          label: 'Eliminar',
                        ),
                      ],
                    ),

                    // The child of the Slidable is what the user sees when the
                    // component is not dragged.
                    child: ListTile(
                      /*trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.edit_outlined),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.delete_outline),
                          ),
                        ],
                      ),*/
                      title: Text(
                          '${widget.carros[index].marca} - ${widget.carros[index].modelo}'),
                      subtitle: Text(
                          '${widget.carros[index].color} - ${widget.carros[index].cantidadDeLlantas.toString()}'),
                      leading: CircleAvatar(
                        radius: 20,
                        child: ClipOval(
                          child: Image.asset(
                            './assets/images/tocho.jpg',
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
