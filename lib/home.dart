import 'package:flutter/material.dart';
import 'package:mi_primera_app_78/contantes.dart' as cons;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack( //USAR MUCHOS WIDGETS O MUCHOS HIJOS
        children: [
          Column(
            children: [
              cardWidget(texto: 'Nuevo MENSAJE 1', 
                showOrHide: true,
                size: 25,
              ),
              cardWidget(texto: 'Nuevo MENSAJE 10',
                showOrHide: true,
                size: 50,),
              cardWidget(texto: 'Nuevo MENSAJE 100',
                showOrHide: false,
                size: 15,),
              cardWidget(texto: 'Nuevo MENSAJE 1000',
                showOrHide: true,
                size: 5,),
            ],
          )
        ],
      ),
    );
  }
}

class cardWidget extends StatelessWidget {
  const cardWidget({
    super.key, 
    required this.texto, 
    required this.showOrHide,
    required this.size
  });

  final String texto;
  final bool showOrHide;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cons.blanco,
      elevation: 15,
      child: Padding(
        padding: EdgeInsets.all(size),
        child: Row(
          children: [
            ///Toma todo el espacio que queramos
            Expanded( //33.333333%
              flex: 5, //50%
              child: Text(texto),
            ),
            showOrHide ? Expanded(
                flex: 1,//10%
                child: Container(
                  color: Colors.red, height: 20,
                )
            ) : Text('data'),
            Expanded(
              flex: 4, //40%
              child: Icon(Icons.sms),
            )
          ],
        ),
      )
    );
  }
}
