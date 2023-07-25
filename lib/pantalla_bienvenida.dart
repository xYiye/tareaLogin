import 'package:flutter/material.dart';

class PantallaBienvenida extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Text(
          '¡Bienvenid@, funcionó la validación de credenciales!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
