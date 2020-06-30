class Bairro {


  String cidade;
  int cidadeId;
  int id;
  String nome;

  Bairro({this.cidade, this.cidadeId, this.id, this.nome});

  Bairro.fromJson(Map<String, dynamic> json) {
    cidade = json['cidade'];
    cidadeId = json['cidade_id'];
    id = json['id'];
    nome = json['nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cidade'] = this.cidade;
    data['cidade_id'] = this.cidadeId;
    data['id'] = this.id;
    data['nome'] = this.nome;
    return data;
  }
}