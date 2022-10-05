import 'package:ejemplo_1/classes/carro.dart';

enum TipoDeOrdenamiento {
  porMarca,
  porModelo,
  porColor,
  porID,
  ninguno,
}

class OrdenamientoTablaHash {
  static final Map<int, Carro> miTablaHashDeCarros = {};
  static TipoDeOrdenamiento tipoDeOrdenamiento = TipoDeOrdenamiento.ninguno;

  static List<Carro> search(
      String marca, String modelo, int cantidadDeLlantas) {
    List<Carro> resultado = [];

    miTablaHashDeCarros.forEach((key, carro) {
      if ((carro.marca.toLowerCase().contains(marca.toLowerCase()) ||
              carro.modelo.toLowerCase().contains(modelo.toLowerCase())) &&
          (cantidadDeLlantas == 0
              ? true
              : carro.cantidadDeLlantas == cantidadDeLlantas)) {
        resultado.add(carro);
        if (resultado.length >= 5) return;
      }
    });

    return resultado;
  }

  static void delete(Carro carro) {
    miTablaHashDeCarros.remove(carro);

    switch (tipoDeOrdenamiento) {
      case TipoDeOrdenamiento.porMarca:
        porMarca();
        break;
      case TipoDeOrdenamiento.porModelo:
        porModelo();
        break;
      case TipoDeOrdenamiento.porColor:
        porColor();
        break;
      case TipoDeOrdenamiento.porID:
        porID();
        break;
      case TipoDeOrdenamiento.ninguno:
        break;
    }
  }

  static void modify(Carro carroAnterior, Carro carroNuevo) {
    // int index = miTablaHashDeCarros(carroAnterior);

    // miTablaHashDeCarros[index].cantidadDeLlantas = carroNuevo.cantidadDeLlantas;
    // miTablaHashDeCarros[index].color = carroNuevo.color;
    // miTablaHashDeCarros[index].marca = carroNuevo.marca;
    // miTablaHashDeCarros[index].iD = carroNuevo.iD;
    // miTablaHashDeCarros[index].modelo = carroNuevo.modelo;

    switch (tipoDeOrdenamiento) {
      case TipoDeOrdenamiento.porMarca:
        porMarca();
        break;
      case TipoDeOrdenamiento.porModelo:
        porModelo();
        break;
      case TipoDeOrdenamiento.porColor:
        porColor();
        break;
      case TipoDeOrdenamiento.porID:
        porID();
        break;
      case TipoDeOrdenamiento.ninguno:
        break;
    }
  }

  static void add(Carro carro) {
    Map<int, Carro> newElement = <int, Carro>{};
    newElement[1] = carro;
    miTablaHashDeCarros.addAll(newElement);
    switch (tipoDeOrdenamiento) {
      case TipoDeOrdenamiento.porMarca:
        porMarca();
        break;
      case TipoDeOrdenamiento.porModelo:
        porModelo();
        break;
      case TipoDeOrdenamiento.porColor:
        porColor();
        break;
      case TipoDeOrdenamiento.porID:
        porID();
        break;
      case TipoDeOrdenamiento.ninguno:
        break;
    }
  }

  static void poblarLista() {
    add(
      Carro(
        cantidadDeLlantas: 4,
        marca: "GM",
        modelo: "SIERRA",
        color: "AMARILLO",
        iD: 0.1,
      ),
    );
    add(
      Carro(
        cantidadDeLlantas: 4,
        marca: "SUSUKI",
        modelo: "X",
        color: "NEGRO",
        iD: 1.1,
      ),
    );
    add(
      Carro(
        cantidadDeLlantas: 4,
        marca: "MAZDA",
        modelo: "3",
        color: "BLANCO",
        iD: 0.3,
      ),
    );
    add(
      Carro(
        cantidadDeLlantas: 4,
        marca: "TOYOTA",
        modelo: "SUPRA",
        color: "AZUL",
        iD: 4.5,
      ),
    );
    add(Carro(
        cantidadDeLlantas: 4,
        marca: "AUDI",
        modelo: "A4",
        color: "AZUL MARINO",
        iD: 0.5));
    add(
      Carro(
        cantidadDeLlantas: 4,
        marca: "MCLAREN",
        modelo: "T1",
        color: "NEGRO",
        iD: 3.3,
      ),
    );
    add(
      Carro(
        cantidadDeLlantas: 4,
        marca: "HONDA",
        modelo: "CIVIC",
        color: "VERDE",
        iD: 0.2,
      ),
    );
    add(
      Carro(
        cantidadDeLlantas: 4,
        marca: "FORD",
        modelo: "GT40",
        color: "ROJO",
        iD: 0.6,
      ),
    );
    add(
      Carro(
        cantidadDeLlantas: 4,
        marca: "BMW",
        modelo: "M3",
        color: "GRIS",
        iD: 2.1,
      ),
    );
    add(
      Carro(
        cantidadDeLlantas: 4,
        marca: "TESLA",
        modelo: "MODEL3",
        color: "ROJO",
        iD: 1.8,
      ),
    );
    add(
      Carro(
        cantidadDeLlantas: 4,
        marca: "FERRARI",
        modelo: "F40",
        color: "ROJO",
        iD: 1.0,
      ),
    );
  }

  static void porMarca() {
    // for (int i = 0; i < miTablaHashDeCarros.length; i++) {
    //   for (int j = i; j < miTablaHashDeCarros.length; j++) {
    //     if (miTablaHashDeCarros[i]
    //             .marca
    //             .compareTo(miTablaHashDeCarros[j].marca) >
    //         0) {
    //       Carro aux = miTablaHashDeCarros[i];
    //       miTablaHashDeCarros[i] = miTablaHashDeCarros[j];
    //       miTablaHashDeCarros[j] = aux;
    //     }
    //   }
    // }
    tipoDeOrdenamiento = TipoDeOrdenamiento.porMarca;
  }

  static void porModelo() {
    // for (int i = 0; i < miTablaHashDeCarros.length; i++) {
    //   for (int j = i; j < miTablaHashDeCarros.length; j++) {
    //     if (miTablaHashDeCarros[i]
    //             .modelo
    //             .compareTo(miTablaHashDeCarros[j].modelo) >
    //         0) {
    //       Carro aux = miTablaHashDeCarros[i];
    //       miTablaHashDeCarros[i] = miTablaHashDeCarros[j];
    //       miTablaHashDeCarros[j] = aux;
    //     }
    //   }
    // }
    tipoDeOrdenamiento = TipoDeOrdenamiento.porModelo;
  }

  static void porColor() {
    // for (int i = 0; i < miTablaHashDeCarros.length; i++) {
    //   for (int j = i; j < miTablaHashDeCarros.length; j++) {
    //     if (miTablaHashDeCarros[i]
    //             .color
    //             .compareTo(miTablaHashDeCarros[j].color) >
    //         0) {
    //       Carro aux = miTablaHashDeCarros[i];
    //       miTablaHashDeCarros[i] = miTablaHashDeCarros[j];
    //       miTablaHashDeCarros[j] = aux;
    //     }
    //   }
    // }
    tipoDeOrdenamiento = TipoDeOrdenamiento.porColor;
  }

  static void porID() {
    // for (int i = 0; i < miTablaHashDeCarros.length; i++) {
    //   for (int j = i; j < miTablaHashDeCarros.length; j++) {
    //     if (miTablaHashDeCarros[i].iD > miTablaHashDeCarros[j].iD) {
    //       Carro aux = miTablaHashDeCarros[i];
    //       miTablaHashDeCarros[i] = miTablaHashDeCarros[j];
    //       miTablaHashDeCarros[j] = aux;
    //     }
    //   }
    // }
    tipoDeOrdenamiento = TipoDeOrdenamiento.porID;
  }
}
