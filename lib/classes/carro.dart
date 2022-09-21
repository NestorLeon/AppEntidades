class Carro {
  int cantidadDeLlantas;
  String marca;
  String modelo;
  String color;
  double iD;

  Carro({
    this.cantidadDeLlantas = 0,
    this.marca = "",
    this.modelo = "",
    this.color = "",
    required this.iD,
  });

  @override
  String toString() {
    return 'Cant de Llantas: $cantidadDeLlantas - Marca: $marca - Modelo: $modelo - Color: $color - ID: $iD';
  }

  // Carro(
  //     {required this.CantidadDeLlantas,
  //     required this.Marca,
  //     required this.Modelo,
  //     required this.Color,
  //     required this.ID});
  // Carro(
  //     int cantDeLlantas, String marca, String modelo, String color, double id) {
  //   this.CantidadDeLlantas = cantDeLlantas;
  //   this.Marca = marca;
  //   this.Modelo = modelo;
  //   this.Color = color;
  //   this.ID = id;
  // }
}
