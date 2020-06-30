import 'dart:convert';

import 'dart:io';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:salvemaria/bairro/bairro.dart';
import 'package:salvemaria/cidade/cidade.dart';
import 'package:salvemaria/pessoa/pessoa.dart';
import 'package:salvemaria/utils/response_api.dart';

class BairroApi{


  static Future<List<Bairro>> getBairros(int cidade) async {



    try{


      HttpClient client = new HttpClient();
     // client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);



      final _authority = "salvemaria.ssp.ma.gov.br:8383";
      final _path = "/rest/bairro/listar/$cidade";
      final _uri =  Uri.http(_authority, _path);



      HttpClientRequest request = await client.getUrl(_uri);
      request.headers.set('content-type', 'application/json');


      HttpClientResponse response = await request.close();


      if(response.statusCode == 204){


        return [];

      }


      String reply = await response.transform(utf8.decoder).join();



      List list = convert.json.decode(reply);

      return list.map<Bairro>((map) => Bairro.fromJson(map)).toList();


    }catch(e){

      print(e);

    }

  }

}