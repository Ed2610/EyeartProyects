import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'pages/inicio.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E&E art',
      home: const LoginPage(),
      routes: <String, WidgetBuilder>{
        '/inicio': (BuildContext context) => const Inicio(),
        '/LoginPage': (BuildContext context) => const LoginPage(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String _errorMessage = '';
  String _username = ''; // Nuevo
  String _password = ''; // Nuevo

  Future<void> login() async {
    final body = {
      'correo': usernameController.text.toString(),
      'contrasena': passwordController.text.toString()
    };
    try {
      final response = await http.post(Uri.parse("https://tecrv.000webhostapp.com/login.php"), body: body);
      
      if (response.statusCode == 200) {
        
        // Autenticación exitosa, navegar a la página de inicio
        Navigator.pushReplacementNamed(context, '/inicio');
      } else {
        // Error de autenticación, mostrar mensaje de error
        setState(() {
          _errorMessage = 'Credenciales inválidas, por favor intenta nuevamente.';
        });
      }
    } catch (e) {
      // Error de conexión, mostrar mensaje de error
      setState(() {
        _errorMessage = 'Error de conexión al servidor. Por favor, verifica tu conexión de red.';
      });
    }

    // Actualizar los valores de _username y _password
    setState(() {
      _username = usernameController.text;
      _password = passwordController.text;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                Colors.white70,
              ],
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 77.0),
                width: 350.0,
                height: 350.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                //child: const CircleAvatar(
                  //backgroundColor: Color.fromRGBO(229, 236, 164, 0.856),
                  child: const Image(
                    width: 500,
                    height: 500,
                    image: AssetImage("logo1.png"),
                  ),
                //),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(
                  top: 93,
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      padding: const EdgeInsets.only(
                        top: 4, left: 16, right: 16, bottom: 4),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black, blurRadius: 5)
                        ]
                      ),
                      child: TextFormField(
                        controller: usernameController,
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          hintText: 'Correo'
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 50,
                      margin: const EdgeInsets.only(top: 32),
                      padding: const EdgeInsets.only(
                        top: 4, left: 16, bottom: 4),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black, blurRadius: 5)
                        ]
                      ),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.vpn_key,
                            color: Colors.black,
                          ),
                          hintText: 'Contraseña'
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 6,
                          right: 32,
                        ),
                        child: Text(
                          'Recordar contraseña',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      )
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        login();
                        Navigator.pushReplacementNamed(context, '/inicio');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(229, 236, 164, 0.856),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),minimumSize: Size(MediaQuery.of(context).size.width * 0.5, 80),
                      ),
                      child: const Text("Iniciar sesión"),
                    ),

                    Text(_errorMessage, style: const TextStyle(fontSize: 25.0, color: Colors.red)),
                    // Nuevas cajas de texto que muestran lo que se mandó al login()
                    Text("Username enviado: $_username"),
                    Text("Password enviado: $_password"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
