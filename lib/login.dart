import 'package:flutter/material.dart';
import 'pantalla_bienvenida.dart'; // Importamos la pantalla de Bienvenida

class PantallaInicioSesion extends StatefulWidget {
  @override
  _PantallaInicioSesionState createState() => _PantallaInicioSesionState();
}

class _PantallaInicioSesionState extends State<PantallaInicioSesion> {
  final _formKey = GlobalKey<FormState>();
  String? _nombreUsuario;
  String? _contrasena;

  final String _nombreUsuarioCorrecto = 'felix.deras@unah.hn';
  final String _contrasenaCorrecta = '20192001462';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarea Login - Felix Deras 20192001462'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/pumita.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Nombre de Usuario'),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Por favor, ingresa tu nombre de usuario';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _nombreUsuario = value;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(labelText: 'Contraseña'),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Por favor, ingresa tu contraseña';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _contrasena = value;
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _formKey.currentState?.save();

                          if (_nombreUsuario == _nombreUsuarioCorrecto &&
                              _contrasena == _contrasenaCorrecta) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PantallaBienvenida(),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Credenciales incorrectas'),
                              ),
                            );
                          }
                        }
                      },
                      child: Text('Iniciar Sesión'),
                    ),
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

void main() => runApp(MaterialApp(
      home: PantallaInicioSesion(),
    ));
