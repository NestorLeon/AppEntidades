import 'package:ejemplo_1/classes/ordenamiento_tabla_hash.dart';
import 'package:ejemplo_1/screens/tabla_hash_dicc/carros_agregar_tabla_hash_screen.dart';
import 'package:ejemplo_1/widgets/navigation_drawer_tabla_hash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../classes/carro.dart';
import 'package:ejemplo_1/screens/tabla_hash_dicc/carros_modificar_tabla_hash_screen.dart';

class VerTodosTablaHashScreen extends StatefulWidget {
  Map<int, Carro> carros = {};

  VerTodosTablaHashScreen({Key? key, required this.carros}) : super(key: key);

  @override
  State<VerTodosTablaHashScreen> createState() =>
      _VerTodosTablaHashScreenState();
}

class _VerTodosTablaHashScreenState extends State<VerTodosTablaHashScreen> {
  //List<Carro> carros = [];

  void onEdit(BuildContext context, int index) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ModificarCarroTablaHashScreen(
          carro: widget.carros[index] ?? Carro(iD: 0),
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
                'Se eliminó el elemento ${widget.carros[index]!.marca}-${widget.carros[index]!.modelo}'),
            duration: const Duration(seconds: 2),
          )));
        }
        setState(() {
          widget.carros.remove(index);
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
              builder: (context) => AgregarCarroTablaHashScreen(
                carros: OrdenamientoTablaHash.miTablaHashDeCarros,
              ),
            ),
          );
        },
        child: const Icon(Icons.add_outlined),
      ),
      drawer: const NavigationDrawerTablaHash(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            /* leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
            ), */
            title: const Text('Ver Todos'),
            actions: [
              IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: MySearchDelegate());
                },
                icon: const Icon(Icons.search),
              ),
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
                      OrdenamientoTablaHash.porMarca();
                      break;
                    case 1:
                      OrdenamientoTablaHash.porModelo();
                      break;
                    case 2:
                      OrdenamientoTablaHash.porColor();
                      break;
                    case 3:
                      OrdenamientoTablaHash.porID();
                      break;
                  }
                  setState(() {
                    widget.carros = OrdenamientoTablaHash.miTablaHashDeCarros;
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
                    key: Key(widget.carros[index]!.iD.toString()),

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
                            'Se eliminó el elemento ${widget.carros[index]!.marca}-${widget.carros[index]?.modelo}',
                          );
                          setState(() {
                            OrdenamientoTablaHash.delete(widget.carros[index]!);
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
                          '${widget.carros[index]!.marca} - ${widget.carros[index]?.modelo}'),
                      subtitle: Text(
                          '${widget.carros[index]!.color} - ${widget.carros[index]?.cantidadDeLlantas.toString()}'),
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

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: const Icon(
          Icons.clear,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        query,
        style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    int? cantidadDeLlantas = int.tryParse(query);
    List<Carro> suggestions =
        OrdenamientoTablaHash.search(query, query, cantidadDeLlantas ?? 0);

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text('${suggestion.marca} - ${suggestion.modelo}'),
          subtitle: Text(
              '${suggestion.color} - ${suggestion.cantidadDeLlantas.toString()}'),
          leading: CircleAvatar(
            radius: 20,
            child: ClipOval(
              child: Image.asset(
                './assets/images/tocho.jpg',
              ),
            ),
          ),
          onTap: () {
            // query = suggestion.marca;
            // showResults(context);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => ModificarCarroTablaHashScreen(
                  carro: suggestions[index],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
