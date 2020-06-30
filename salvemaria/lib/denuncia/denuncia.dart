
import 'package:salvemaria/utils/prefs.dart';
import 'dart:convert' as convert;


class Denuncia{
  

String  tipo;

String latitude;
String longitude;
String imei;
String estado;
String so;
String cep;
String numero;
String endereco;
String cidade;
String complemento;
String bairro;
String cpfUsuario;



Denuncia({this.tipo, this.latitude, this.cpfUsuario, this.longitude, this.cep, this.numero ,this.so,this.estado,  this.imei, this.cidade, this.complemento,this.endereco,});


Denuncia.fromJson(Map<String, dynamic> map) :


this.tipo = map["tipo"],
this.latitude = map["latitude"],
this.imei = map["imei"],
this.estado = map["estado"],
this.longitude = map["longitude"],
this.so = map["so"],
      this.cpfUsuario = map["cpfUsuario"],
this.cep = map["cep"],
this.numero = map["numero"],
this.endereco = map["estado"],
this.cidade = map["cidade"],
this.complemento = map["complemento"];



Map<String, dynamic> toJson(){


final Map<String, dynamic> data = Map<String, dynamic>();

data['tipo'] = this.tipo;
data['latitude'] = this.latitude;
data['imei'] = this.imei;
data['estado'] = this.estado;
data['endereco'] = this.endereco;
data['longitude'] = this.longitude;
data['so'] = this.so;
data['cpfUsuario'] = this.cpfUsuario;
data['cep'] = this.cep;
data['numero'] = this.numero;
data['cidade'] = this.cidade;
data['complemento'] = this.complemento;


return data;

}




}