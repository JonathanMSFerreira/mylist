import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salvemaria/ui/cadastro_vitima.dart';


class TermoUso extends StatefulWidget {
  @override
  TermoUsoState createState() => TermoUsoState();
}

class TermoUsoState extends State<TermoUso> {

 static const RosaApp = const Color(0xFFD95B96);






  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[700],
        centerTitle: true,
        elevation: 0,
        title: Text("TERMO DE USO"),

      ),
        backgroundColor: Colors.white,
        body: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Stack(

              alignment: Alignment.topCenter,

              children:[

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    // Box decoration takes a gradient
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.pink[600],
                        Colors.pink[500],
                        Colors.pink[400],
                        Colors.pink[300],
                      ],
                    ),
                  ),
                ),



                Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                 Container(
                  margin: EdgeInsets.all(10),
                  width: 70.0,
                  height: 70.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage("images/iconSalveMaria.png"),
                      )),
                ),

               Text('SALVE MARIA',
                   style: TextStyle(
                     fontSize: 30.0,
                     fontFamily: 'Reem Kufi',
                     color: Colors.white,
                   )),
               Text('Maranhão',
                   style: TextStyle(
                     fontSize: 20.0,
                     fontFamily: 'Reem Kufi',
                     color: Colors.white,
                   )),
                 Padding(
                   padding: const EdgeInsets.all(15.0),
                   child: Divider(
                   height: 5,
                   color: Colors.white,
                   ),
                 ),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(

                      child: Text('Declaro concordar integralmente com as regras que disciplinam o uso do aplicativo nos termos da legislação'
                          ' pátria vigente que rege a matéria, especialmente o direito ao sigilo dos dados, conforme portaria conjunta Nr. 01/17.',

                         textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Reem Kufi',
                            color: Colors.white,
                        )),
                    ),
                  ),



                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child:
                    RaisedButton(
                      onPressed: () {

                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CadastroVitima()));


                      },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                      padding: const EdgeInsets.all(0.0),
                      child: Ink(
                        decoration:  BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: <Color>[
                              Colors.purple[900],
                              Colors.purple[600],


                            ],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(80.0)),
                        ),
                        child: Container(
                          constraints: const BoxConstraints(minWidth: 88.0, minHeight: 56.0), // min sizes for Material buttons
                          alignment: Alignment.center,
                          child: const Text(
                            'CADASTRAR',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  )

              ]
              )],
            ),
          ],
        )
        
        );
  }
}