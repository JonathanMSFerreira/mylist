import 'dart:convert';
import 'dart:io';
import 'dart:convert' as convert;
import 'package:salvemaria/cidade/cidade.dart';


class CidadeApi{


  static Future<List<Cidade>> getCidades() async {

    try{

      HttpClient client = new HttpClient();
      client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);

      final _authority = "salvemaria.ssp.ma.gov.br:8383";
      final _path = "/rest/cidade/listar";
      final _uri =  Uri.http(_authority, _path);

      HttpClientRequest request = await client.getUrl(_uri);
      request.headers.set('content-type', 'application/json');

      HttpClientResponse response = await request.close();

      if(response.statusCode == 204){

        return [];

      }


      String reply = await response.transform(utf8.decoder).join();
      List list = convert.json.decode(reply);

      return list.map<Cidade>((map) => Cidade.fromJson(map)).toList();


    }catch(e){

      print(e);

    }

  }

}