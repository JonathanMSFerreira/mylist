import 'dart:io';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:salvemaria/pessoa/pessoa.dart';
import 'package:salvemaria/utils/response_api.dart';

class CadastroApi{


  static Future<String> cadastroPessoa(Pessoa pessoa) async {


    HttpClient client = new HttpClient();
    client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);

    var dia = pessoa.dataNascimento.substring(0, 2);
    var mes = pessoa.dataNascimento.substring(3, 5);
    var ano = pessoa.dataNascimento.substring(6, 10);


    String dataNascimentoFormatada = ano + "-" + mes + "-"+dia;


    try{

      var url = 'http://salvemaria.ssp.ma.gov.br:8383/rest/usuarioapp/salvar';

      Map params = {
        "nome": pessoa.nome,
        "nomeMae" : pessoa.nomeMae,
        "cidade": pessoa.cidade,
        "cpf": pessoa.cpf,
        "bairro": pessoa.bairro,
        "complemento": pessoa.complemento,
        "dataNascimento": dataNascimentoFormatada,
        "cep": pessoa.cep,
        "endereco": pessoa.endereco,
        "rg": pessoa.rg,
        "idade": pessoa.idade,
        "nomePai": pessoa.nomePai
      };


      Map<String, String> headers = {
        "Content-Type": "application/json",
      };


      var body = convert.json.encode(params);
      var response = await http.post(url, headers: headers, body: body);

      if(response.statusCode == 200){


        pessoa.save();


      }


      return response.body;


    }catch(e){

          return e.toString();

    }


  }

}