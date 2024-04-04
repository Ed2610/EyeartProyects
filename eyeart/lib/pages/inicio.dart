import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const Inicio());
}

class Inicio extends StatelessWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E&E art',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Productos(title: 'E&E art - Lista de productos'),
    );
  }
}

class Productos extends StatefulWidget {
  const Productos({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Productos> createState() => _ProductosState();
}

class _ProductosState extends State<Productos> {
  late Future<List<Producto>> productos;

  @override
  void initState() {
    super.initState();
    productos = obtenerProductos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Producto>>(
        future: productos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return DataTable(
              columns: const [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Título')),
                DataColumn(label: Text('Precio')),
                DataColumn(label: Text('Categoría')),
              ],
              rows: snapshot.data!.map((producto) => DataRow(
                cells: [
                  DataCell(Text(producto.id.toString())),
                  DataCell(Text(producto.title)),
                  DataCell(Text(producto.price.toString())),
                  DataCell(Text(producto.category)),
                ],
              )).toList(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error al obtener productos: ${snapshot.error}'),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class Producto {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;

  Producto({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
    );
  }
}

Future<List<Producto>> obtenerProductos() async {
  final response = await http.get(Uri.parse("https://fakestoreapi.com/products"));

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => Producto.fromJson(json)).toList();
  } else {
    throw Exception('Error al obtener productos');
  }
}
