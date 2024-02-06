import 'package:flutter/material.dart';
import 'package:mi_primera_app_78/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  ///VARIABLES PARA CAPTURAR EL TEXTO INGRESADO EN LOS TEXTFORMFIELD
  final user = TextEditingController();
  final pass = TextEditingController();

  ///VARIABLE BOOLEANA
  bool bandera = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack( // Puede tener muchos hijos
        children: [
          Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.15,
                  top: 20,
                  right: size.width * 0.15,
                  bottom: 20,
              ),
            child: Column( // Puede tener muchos hijos
              children: [
                const Row( // Puede tener muchos hijos
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'LOGIN',
                      style: TextStyle(fontSize: 25, color: Colors.red),
                    ),
                  ],
                ),
                TextFormField(
                  controller: user,
                  obscureText: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              width: 1,
                              style: BorderStyle.none
                          )
                      ),
                      filled: true,
                      fillColor: Colors.grey,
                      prefixIcon: Icon(Icons.person, color: Colors.white,),
                      labelText: "Usuario"
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                TextFormField(
                  controller: pass,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              width: 1,
                              style: BorderStyle.none
                          )
                      ),
                      filled: true,
                      fillColor: Colors.grey,
                      prefixIcon: Icon(Icons.password, color: Colors.white,),
                      labelText: "Contraseña"
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                ElevatedButton( //UN SOLO WIDGET O SOLO HIJO
                    onPressed: () {
                      ///CAMBIO DE ESTADO EN NUESTRA VISTA
                      setState(() {
                        print(user.text); ///IMPRIME EN TERMINAL LOS VALORES
                        print(pass.text);
                        //if(user.text == 'alejandro' &&
                        //pa ss.text == '123456'){
                          //MANDA A OTRA VISTA
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const Home()));
                        //} else {
                          //bandera = true;
                        //}
                      });
                    }, // FUNCIÓN INTERNA
                    child: const Text(
                      'INGRESAR',
                      style: TextStyle(color: Colors.white),
                    ),
                  style: ElevatedButton.styleFrom(
                    ///COLOR  BACKGROUND
                    primary: Color(0xFF1152CC),
                    ///ATRIBUTO PARA HACER EL BOTÓN CON BORDES REDONDOS
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    fixedSize: Size(size.width * 0.6, 45)
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                ///SI BANDERA == TRUE
                ///MUESTRA EL TEXTO
                ///SI NO
                ///MUESTRA UN CONTENEDOR VACIO
                bandera ? Text(
                  /*'User: ${user.text} \n'
                      'Password: ${pass.text}'*/
                  'USUARIO O CONTRASEÑA INCORRECTOS',
                  style: TextStyle(color: Colors.red),
                ) : Container()
              ],
            ),
          )
        ],
      ),
    );
  }
}
