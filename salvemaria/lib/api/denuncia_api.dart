import 'dart:convert';

import 'dart:io';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:salvemaria/denuncia/denuncia.dart';
import 'package:salvemaria/pessoa/pessoa.dart';
import 'package:salvemaria/utils/response_api.dart';

class DenunciaApi{

  static Future<String> enviarDenuncia(Denuncia d) async {




    try{

      Pessoa p = await Pessoa.get();



      HttpClient client = new HttpClient();
      client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);

      var url = 'http://salvemaria.ssp.ma.gov.br:8383/rest/denuncia/salvar';

      Map params = {

        "tipo": d.tipo,
        "latitude" : d.latitude,
        "longitude": d.longitude,
        "imei": d.imei,
        "numero": d.numero,
        "cidade": d.cidade,
        "bairro": d.bairro,
        "vitima" : p.nome,
        "idade" : p.idade,
        "complemento": d.complemento,
        "cpfUsuario": d.cpfUsuario,
        "so": d.so,
        "cep": d.cep,
        "endereco": d.endereco,
        "estado": d.estado

      };


      Map<String, String> headers = {
        "Content-Type": "application/json",
      };

      var body = convert.json.encode(params);
      var response = await http.post(url, headers: headers, body: body);




      if(response.statusCode == 200){


        return "CHAMADO REALIZADO COM SUCESSO!";


      }

      return response.body;

    }catch(e){

      return e.toString();


    }


}

}