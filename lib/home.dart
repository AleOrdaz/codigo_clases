import 'package:flutter/material.dart';
import 'package:mi_primera_app_78/contantes.dart' as cons;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List mensajes = [];  //Variable de tipo lista

  @override
  void initState() {
    //id # titulo # nom usario # mensaje
    mensajes.add('1#Nuevo mensaje 1#usuario 1#Texto del mensaje');
    mensajes.add('2#Nuevo mensaje 2#usuario 10#Texto del mensaje');
    mensajes.add('3#Nuevo mensaje 3#usuario 100#Texto del mensaje');
    mensajes.add('4#Nuevo mensaje 4#usuario 1000#Texto del mensaje');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack( //USAR MUCHOS WIDGETS O MUCHOS HIJOS
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: mensajes.length,
                    itemBuilder: (BuildContext context, int index) {
                      var datos = mensajes[index].split('#');

                      return cardWidget(texto: '${datos[1]}',
                        nombre: '${datos[2]}',
                        mensaje: '${datos[3]}',
                        showOrHide: true,
                        size: 25,
                      );
                    }
                ),
              )

            ],
          )
          //Nos permete colocar un SCROLL
          /*SingleChildScrollView(
            child: Column(
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
            ),
          )*/
        ],
      ),
    );
  }
}

class cardWidget extends StatelessWidget {
  const cardWidget({
    super.key,
    required this.texto,
    required this.nombre,
    required this.mensaje,
    required this.showOrHide,
    required this.size
  });

  final String texto;
  final String nombre;
  final String mensaje;
  final bool showOrHide;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cons.blanco,
      elevation: 15,
      child: Padding(
        padding: EdgeInsets.all(size),
        child: Column(
          children: [
            Row(
              children: [
                ///Toma todo el espacio que queramos
                Expanded( //33.333333%
                  flex: 6, //50%
                  child: Text(texto),
                ),
                Expanded(
                  flex: 6, //50%
                  child: Text(nombre),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                    flex: 8,
                    child: Text(mensaje)
                ),
                Expanded(
                    flex: 2,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete),
                    )
                ),
                Expanded(
                    flex: 2,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete),
                    )
                )
              ],
            )
          ],
        )
      )
    );
  }
}
