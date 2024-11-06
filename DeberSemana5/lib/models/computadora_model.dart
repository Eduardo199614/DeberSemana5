class ComputadoraModel {
  int? id;
  String procesador;
  String discoDuro;
  String ram;

  ComputadoraModel({
    this.id,
    required this.procesador,
    required this.discoDuro,
    required this.ram,
  });

  // Convertir el objeto en un mapa para la base de datos
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'procesador': procesador,
      'disco_duro': discoDuro,
      'ram': ram,
    };
  }

  // Crear un objeto desde un mapa
  factory ComputadoraModel.fromMap(Map<String, dynamic> map) {
    return ComputadoraModel(
      id: map['id'],
      procesador: map['procesador'],
      discoDuro: map['disco_duro'],
      ram: map['ram'],
    );
  }
}
