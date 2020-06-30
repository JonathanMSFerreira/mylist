import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imei_plugin/imei_plugin.dart';
import 'package:salvemaria/api/denuncia_api.dart';
import 'package:salvemaria/denuncia/denuncia.dart';
import 'package:salvemaria/pessoa/pessoa.dart';
import 'package:salvemaria/ui/mais_informacoes.dart';
import 'package:geolocator/geolocator.dart';


class BotaoPanico extends StatefulWidget {
  @override
  _BotaoPanicoState createState() => _BotaoPanicoState();
}

class _BotaoPanicoState extends State<BotaoPanico> {


  Position _currentPosition;

  String _platformImei = 'Unknown';
  String uniqueId = "Unknown";
  bool _botaoPressionado = false;
  String msgRetorno;
  bool _erro ;
  List<Placemark> _placemark;
  bool _chamadoRealizado = false;




  @override
  void initState() {


    super.initState();

  }





  Future<void> initPlatformState() async {
    String platformImei;
    String idunique;
    try {
      platformImei = await ImeiPlugin.getImei( shouldShowRequestPermissionRationale: false );
      idunique = await ImeiPlugin.getId();
    } on PlatformException {
      platformImei = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _platformImei = platformImei;
      uniqueId = idunique;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(

        elevation: 0,
        backgroundColor: Colors.transparent,

        actions: [


          IconButton(icon: Icon(Icons.close),
              onPressed: (){
                SystemNavigator.pop();
          })


        ],


      ),
      backgroundColor: Colors.white,
      body: Stack(

        alignment: Alignment.center,
        children: <Widget>[

          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(

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

            children: [

              InkWell(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    width: 230.0,
                    height: 230.0,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.pink[900],
                            blurRadius: 10, // soften the shadow
                            spreadRadius: 2.0, //extend the shadow
                            offset: Offset(
                              2.0, // Move to right 10  horizontally
                              2.0, // Move to bottom 5 Vertically
                            ),
                          )
                        ],

                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage("images/botaoDoPanico.png"),
                        )),
                  ),


                  onLongPress:  () async {

                    _acionaBotaoPanico(context);


                  }),
              Center(
                  child: Text('SEGURE O BOTÃO PARA ENVIAR UM CHAMADO',
                      textAlign: TextAlign.center,
                      style: TextStyle(

                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        fontFamily: 'Reem Kufi',
                        color: Colors.white,
                      ))),



              SizedBox(height: 20,),


               _botaoPressionado && msgRetorno != null && _erro != null ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(

                      decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white
                      ),
                        color: _erro == false ? Colors.green : Colors.red,
                        borderRadius: BorderRadius.all(
                            Radius.circular(5.0))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [


                          _erro == false ? Icon(Icons.check_circle, color: Colors.white,size:  35,) : Icon(Icons.report_problem, color: Colors.white,size:  35,),


                            Text(msgRetorno,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  fontFamily: 'Reem Kufi',
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ),
                    ),
                  )) :  Container(),


                _botaoPressionado == true && msgRetorno == null ?


                    Padding(
    
                        padding: EdgeInsets.all(15),
                        child:Card(
                        color: Colors.orange,
                        child: ListTile(
                          title: Text("Realizando chamado...", style: TextStyle(color: Colors.white),),

                      leading:CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        valueColor: new AlwaysStoppedAnimation<Color>(Colors.purple),

                      ) ,

                    )))
                 : Container()



            ],
          )



//            Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                Container(
//                  margin: EdgeInsets.fromLTRB(10, 50, 10, 5),
//                  width: 175.0,
//                  height: 175.0,
//                  decoration: BoxDecoration(
//                    shape: BoxShape.circle,
//                    //border: Border.all(color: Colors.black),
//                    image: DecorationImage(
//                      fit: BoxFit.contain,
//                      image: AssetImage("images/botaoDenuncia.png"),
//                    ),
//                  ),
//                ),
//                GestureDetector(
//                    child: Container(
//                      margin: EdgeInsets.fromLTRB(10, 50, 10, 5),
//                      width: 175.0,
//                      height: 175.0,
//                      decoration: BoxDecoration(
//                        shape: BoxShape.circle,
//                        image: DecorationImage(
//                          fit: BoxFit.contain,
//                          image: AssetImage("images/maisInformacoes.png"),
//                        ),
//                      ),
//                    ),
//                    onTap: () {
//                      Navigator.push(
//                          context,
//                          MaterialPageRoute(
//                              builder: (context) => MaisInformacoesPage()));
//                    })
//              ],
//            ),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                Container(
//                  margin: EdgeInsets.fromLTRB(60, 1, 10, 20),
//                  child: Text('Denúncia',
//                      style: TextStyle(
//                          fontSize: 20.0,
//                          fontFamily: 'Reem Kufi',
//                          color: RosaApp)),
//                ),
//                 GestureDetector(
//                  child: Container(
//                    margin: EdgeInsets.fromLTRB(10, 1, 30, 20),
//                    child: Text('Mais informações',
//                        style: TextStyle(
//                            fontSize: 20.0,
//                            fontFamily: 'Reem Kufi',
//                            color: RosaApp)),
//                  ),
//                ),
//              ],
//            ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.purple,
          child: Text('USE COM RESPONSABILIDADE',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30.0,
                  letterSpacing: 1,
                  height: 1.5,
                  fontFamily: 'Reem Kufi',
                  color: Colors.white))),
    );
  }


   String _formataTexto(String texto)
  {


    print(texto);
    String comAcentos = "ÄÅÁÂÀÃäáâàãÉÊËÈéêëèÍÎÏÌíîïìÖÓÔÒÕöóôòõÜÚÛüúûùÇç";
    String semAcentos = "AAAAAAaaaaaEEEEeeeeIIIIiiiiOOOOOoooooUUUuuuuCc";

    for (int i = 0; i < comAcentos.length; i++)
    {
      texto = texto.replaceAll(comAcentos[i].toString(), semAcentos[i].toString());

    }


    texto = texto.toUpperCase();
    return texto;
  }
    _acionaBotaoPanico(context) {


         if(_chamadoRealizado == true){

           setState(() {

             _erro = true;
             msgRetorno = "VOCÊ JÁ REALIZOU UM CHAMADO!\nPor favor, aguarde!";
           });




         }else {

          

           _confirmarAlerta(context);







         }
    }

    void _confirmaAcionaBotaoPanico() {
        setState(() {
        _botaoPressionado = true;
      });
      
      
      final Geolocator geolocator = Geolocator()
        ..forceAndroidLocationManager;
      
      geolocator.isLocationServiceEnabled().then((value) {
        if (value == true) {
          geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.best).then((
              Position position) {
            setState(() {
              _currentPosition = position;
            });
      
      
            initPlatformState().then((value) {
              Geolocator()
                  .placemarkFromCoordinates(
                  _currentPosition.latitude, _currentPosition.longitude)
                  .then((value) {
                setState(() {
                  _placemark = value;
                });
      
      
                Denuncia d = new Denuncia();
                d.tipo = "PANICO";
                d.latitude = _currentPosition.latitude.toString();
                d.longitude = _currentPosition.longitude.toString();
                d.estado = _placemark
                    .elementAt(0)
                    .administrativeArea;
                d.so = "Android";
                d.cep = _placemark
                    .elementAt(0)
                    .postalCode;
                d.complemento = "";
                d.bairro = _formataTexto(_placemark
                    .elementAt(0)
                    .subLocality);
                d.cidade = _placemark
                    .elementAt(0)
                    .subAdministrativeArea;
                d.numero = _placemark
                    .elementAt(0)
                    .subThoroughfare;
                d.imei = _platformImei;
                d.endereco = _placemark
                    .elementAt(0)
                    .thoroughfare;
      
                DenunciaApi.enviarDenuncia(d).then((value) {
                  if (value == "CHAMADO REALIZADO COM SUCESSO!") {
                    setState(() {
                      _chamadoRealizado = true;
                      _erro = false;
                      msgRetorno = value;
                    });
                  } else {
                    setState(() {
                      _erro = true;
                      msgRetorno =
                      "ERRO AO FAZER CHAMADO\nVerifique sua conexão com a internet!";
                    });
                  }
                });
              }).catchError((e) {
                setState(() {
                  _erro = true;
                  msgRetorno =
                  "ERRO AO FAZER CHAMADO\nNão foi possível obter sua localização!";
                });
              });
            }).catchError((e) {
              _erro = true;
              msgRetorno =
              "ERRO AO FAZER CHAMADO\nNão foi possível obter sua localização!";
            });
          }).catchError((e) {
            setState(() {
              _erro = true;
              msgRetorno =
              "ERRO AO FAZER CHAMADO\nNão foi possível obter sua localização!";
            });
          });
        } else {
          setState(() {
            _erro = true;
            msgRetorno =
            "ERRO AO FAZER CHAMADO\nNão foi possível obter sua localização!";
          });
        }
      });
    }


  _confirmarAlerta(BuildContext context) {
    Widget cancelaButton =  FlatButton(
      child: Text("NÃO",style: TextStyle(color: Colors.pink, fontSize: 20),),
      onPressed:  () {

        Navigator.pop(context);

      },
    );
    Widget continuaButton = FlatButton(
      child: Text("SIM", style: TextStyle(color: Colors.pink, fontSize: 20),),
      onPressed:  () {


        Navigator.pop(context);
        _confirmaAcionaBotaoPanico();


      },
    );

    AlertDialog alert = AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Alertando Polícia", style: TextStyle(color: Colors.purple, fontSize: 18),),
        ],
      ),
      backgroundColor: Colors.pink[200],

      content:

      Column(
        mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisSize: MainAxisSize.min,
       children: [

         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text("Deseja realmente acionar a polícia?",textAlign: TextAlign.justify, style: TextStyle(color: Colors.white),),
         ),


         Divider(),
         Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children:[
               cancelaButton,

               Text("|", style: TextStyle(color: Colors.white, fontSize: 18),),

               continuaButton,

             ])


       ],


      )


    );
    //exibe o diálogo
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }




}
