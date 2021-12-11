//Carrito carritoFromMap(String str) => Carrito.fromMap(json.decode(str));
//String carritoToMap(Carrito data) => json.encode(data.toMap());

class Carrito {

  Carrito({
    required this.id,
    required this.carritoid,
    required this.productoid,
    required this.cantidad,
    //required this.precio,
    required this.subtotal,
  });

  final int id;
  final int carritoid;
  final int productoid;
  late final int cantidad;
  //final String precio;
  final String subtotal;

  Carrito.fromJson(Map json) :
    id = json["id"],
    carritoid = json["carrito_id"],
    productoid = json["producto_id"],
    cantidad = json["cantidad"],
    //precio = json["precio"],
    subtotal = json["subtotal"];

  Map toJson() {
    return {
      "id": id,
      "carritoid": carritoid,
      "productoid": productoid,
      "cantidad": cantidad,
      //"precio": precio,
      "subtotal": subtotal,
    };
  }
}