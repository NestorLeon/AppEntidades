import 'package:ejemplo_1/classes/carro.dart';

enum TipoDeOrdenamiento {
  porMarca,
  porModelo,
  porColor,
  porID,
  ninguno,
}

class OrdenamientoLista {
  static final List<Carro> miListaDeCarros = [];
  static TipoDeOrdenamiento tipoDeOrdenamiento = TipoDeOrdenamiento.ninguno;

  static List<Carro> search(
      String marca, String modelo, int cantidadDeLlantas) {
    return miListaDeCarros
        .where((carro) =>
            (carro.marca.toLowerCase().contains(marca.toLowerCase()) ||
                carro.modelo.toLowerCase().contains(modelo.toLowerCase())) &&
            (cantidadDeLlantas == 0
                ? true
                : carro.cantidadDeLlantas == cantidadDeLlantas))
        .take(5)
        .toList();
  }

  static void delete(Carro carro) {
    miListaDeCarros.remove(carro);

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
    int index = miListaDeCarros.indexOf(carroAnterior);

    miListaDeCarros[index].cantidadDeLlantas = carroNuevo.cantidadDeLlantas;
    miListaDeCarros[index].color = carroNuevo.color;
    miListaDeCarros[index].marca = carroNuevo.marca;
    miListaDeCarros[index].iD = carroNuevo.iD;
    miListaDeCarros[index].modelo = carroNuevo.modelo;

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
    miListaDeCarros.add(carro);
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
    miListaDeCarros.add(
      Carro(
        cantidadDeLlantas: 4,
        marca: "GM",
        modelo: "SIERRA",
        color: "AMARILLO",
        iD: 0.1,
      ),
    );
    miListaDeCarros.add(
      Carro(
        cantidadDeLlantas: 4,
        marca: "SUSUKI",
        modelo: "X",
        color: "NEGRO",
        iD: 1.1,
      ),
    );
    miListaDeCarros.add(
      Carro(
        cantidadDeLlantas: 4,
        marca: "MAZDA",
        modelo: "3",
        color: "BLANCO",
        iD: 0.3,
      ),
    );
    miListaDeCarros.add(
      Carro(
        cantidadDeLlantas: 4,
        marca: "TOYOTA",
        modelo: "SUPRA",
        color: "AZUL",
        iD: 4.5,
      ),
    );
    miListaDeCarros.add(Carro(
        cantidadDeLlantas: 4,
        marca: "AUDI",
        modelo: "A4",
        color: "AZUL MARINO",
        iD: 0.5));
    miListaDeCarros.add(
      Carro(
        cantidadDeLlantas: 4,
        marca: "MCLAREN",
        modelo: "T1",
        color: "NEGRO",
        iD: 3.3,
      ),
    );
    miListaDeCarros.add(
      Carro(
        cantidadDeLlantas: 4,
        marca: "HONDA",
        modelo: "CIVIC",
        color: "VERDE",
        iD: 0.2,
      ),
    );
    miListaDeCarros.add(
      Carro(
        cantidadDeLlantas: 4,
        marca: "FORD",
        modelo: "GT40",
        color: "ROJO",
        iD: 0.6,
      ),
    );
    miListaDeCarros.add(
      Carro(
        cantidadDeLlantas: 4,
        marca: "BMW",
        modelo: "M3",
        color: "GRIS",
        iD: 2.1,
      ),
    );
    miListaDeCarros.add(
      Carro(
        cantidadDeLlantas: 4,
        marca: "TESLA",
        modelo: "MODEL3",
        color: "ROJO",
        iD: 1.8,
      ),
    );
    miListaDeCarros.add(
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
    for (int i = 0; i < miListaDeCarros.length; i++) {
      for (int j = i; j < miListaDeCarros.length; j++) {
        if (miListaDeCarros[i].marca.compareTo(miListaDeCarros[j].marca) > 0) {
          Carro aux = miListaDeCarros[i];
          miListaDeCarros[i] = miListaDeCarros[j];
          miListaDeCarros[j] = aux;
        }
      }
    }
    tipoDeOrdenamiento = TipoDeOrdenamiento.porMarca;
  }

  static void porModelo() {
    for (int i = 0; i < miListaDeCarros.length; i++) {
      for (int j = i; j < miListaDeCarros.length; j++) {
        if (miListaDeCarros[i].modelo.compareTo(miListaDeCarros[j].modelo) >
            0) {
          Carro aux = miListaDeCarros[i];
          miListaDeCarros[i] = miListaDeCarros[j];
          miListaDeCarros[j] = aux;
        }
      }
    }
    tipoDeOrdenamiento = TipoDeOrdenamiento.porModelo;
  }

  static void porColor() {
    for (int i = 0; i < miListaDeCarros.length; i++) {
      for (int j = i; j < miListaDeCarros.length; j++) {
        if (miListaDeCarros[i].color.compareTo(miListaDeCarros[j].color) > 0) {
          Carro aux = miListaDeCarros[i];
          miListaDeCarros[i] = miListaDeCarros[j];
          miListaDeCarros[j] = aux;
        }
      }
    }
    tipoDeOrdenamiento = TipoDeOrdenamiento.porColor;
  }

  static void porID() {
    for (int i = 0; i < miListaDeCarros.length; i++) {
      for (int j = i; j < miListaDeCarros.length; j++) {
        if (miListaDeCarros[i].iD > miListaDeCarros[j].iD) {
          Carro aux = miListaDeCarros[i];
          miListaDeCarros[i] = miListaDeCarros[j];
          miListaDeCarros[j] = aux;
        }
      }
    }
    tipoDeOrdenamiento = TipoDeOrdenamiento.porID;
  }
}
