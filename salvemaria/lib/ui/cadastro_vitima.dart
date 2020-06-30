import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:salvemaria/api/cadastro_api.dart';
import 'package:salvemaria/bairro/bairro.dart';
import 'package:salvemaria/bairro/bairro_api.dart';
import 'package:salvemaria/cidade/cidade.dart';
import 'package:salvemaria/cidade/cidade_api.dart';
import 'package:salvemaria/pessoa/pessoa.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:salvemaria/ui/botao_panico.dart';


class CadastroVitima extends StatefulWidget {

  @override
  _CadastroVitimaState createState() => _CadastroVitimaState();

}

class _CadastroVitimaState extends State<CadastroVitima> {


  final _formKey = GlobalKey<FormState>();
  final _dataController = new MaskedTextController(mask: '00/00/0000');
  final _cpfController = new MaskedTextController(mask: '000.000.000-00');
  final _cepController = new MaskedTextController(mask: '00000.000');
  final _nomeController = new TextEditingController();
  final _nomeMaeController = new  TextEditingController();
  final _nomePaiController = new  TextEditingController();
  final _enderecoController = new TextEditingController();
  final _rgController = new TextEditingController();
  final _bairroController = new  TextEditingController();
  final _cidadeController = new TextEditingController();
  final _numeroController = new TextEditingController();
  final _complementoController = new TextEditingController();
  final _idadeController = new TextEditingController();

  static const RosaApp = const Color(0xFFD95B96);

  Cidade _cidadeSelecionada ;
  Bairro _bairroSelecionado ;
  List<Cidade> _cidades;
  List<Bairro>  _bairros = new List<Bairro>();
  Pessoa pessoa;

  bool _botaoPressionado = false;




  @override
  void dispose() {
    _dataController.dispose();
    _cpfController.dispose();
    _cepController.dispose();
    _nomeController.dispose();
    _nomeMaeController.dispose();
    _nomePaiController.dispose();
    _enderecoController.dispose();
    _rgController..dispose();
    _bairroController.dispose();
    _cidadeController.dispose();
    _numeroController.dispose();
    _complementoController.dispose();
    _idadeController.dispose();
    super.dispose();
  }



  @override
  void initState() {

    pessoa = new Pessoa();
    _carregaCidades();
    super.initState();

  }


  _carregaCidades() async {

    _cidades = await CidadeApi.getCidades();
    setState(() {
    });

  }



  _carregaBairros(int c) async {
    _bairros = await  BairroApi.getBairros(c);
    setState(() {
    });
  }





  @override
  Widget build(BuildContext context) {
    return FlutterEasyLoading(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: RosaApp,
          title: Text("FAÇA SEU CADASTRO" , style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Reem Kufi',

          )),


        ),


        body: _cidades == null ?

        Container(

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


         child: Center( child: CircularProgressIndicator(
           backgroundColor: Colors.white,
           valueColor: new AlwaysStoppedAnimation<Color>(Colors.purple),

         )),



       ):


        _buildForm(context),

      ),
    );
  }

   _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(

        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.person, color: Colors.purple,),
                    Text("DADOS PESSOAIS", style: TextStyle(color: Colors.purple, fontSize: 20),),
                  ],
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _nomeController,
                  keyboardType: TextInputType.text,
                  cursorColor: RosaApp,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: RosaApp),
                      labelText: "Nome *",
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: RosaApp)),
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                      hintStyle: TextStyle(color: Colors.white.withAlpha(80))

                  ), validator: (value) {

                  print("nome:  $value");

                  if (value.isEmpty) {
                    return 'Informe seu nome completo';
                  }
                  return null;
                },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _idadeController,
                  keyboardType: TextInputType.numberWithOptions(signed: false),
                  cursorColor: RosaApp,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: RosaApp),
                      labelText: "Idade *",
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: RosaApp)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple)),
                      hintStyle: TextStyle(color: Colors.white.withAlpha(80))

                  ),

                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Informe sua idade';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _nomeMaeController,
                  keyboardType: TextInputType.text,
                  cursorColor: RosaApp,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: RosaApp),
                      labelText: "Nome da mãe *",
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: RosaApp)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple)),
                      hintStyle: TextStyle(color: Colors.white.withAlpha(80))

                  ),

                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Informe o nome de sua mãe';
                    }
                    return null;
                  },
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _nomePaiController,
                  keyboardType: TextInputType.text,
                  cursorColor: RosaApp,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: RosaApp),
                      labelText: "Nome do pai",
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: RosaApp)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple)),
                      hintStyle: TextStyle(color: Colors.white.withAlpha(80))

                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(

                  controller: _dataController,
                  cursorColor: RosaApp,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: RosaApp),
                      labelText: "Data de Nascimento *",
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: RosaApp)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple)),
                      hintStyle: TextStyle(color: Colors.white.withAlpha(80))

                  ),

                  validator: (value) {

                    print("nome:  $value");
                    if (value.isEmpty) {
                      return 'Informe sua data de nascimento';
                    }
                    return null;
                  },
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.contact_mail, color: Colors.purple,),
                    Text(" DOCUMENTAÇÃO", style: TextStyle(color: Colors.purple, fontSize: 20),),
                  ],
                ),
              ),



              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _rgController,
                  keyboardType: TextInputType.numberWithOptions(signed: false),
                  cursorColor: RosaApp,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: RosaApp),
                      labelText: "RG *",
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: RosaApp)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple)),
                      hintStyle: TextStyle(color: Colors.white.withAlpha(80))

                  ),

                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Informe o número do seu RG';
                    }
                    return null;
                  },
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(

                  controller: _cpfController,
                  keyboardType: TextInputType.numberWithOptions(signed: false),
                  cursorColor: RosaApp,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: RosaApp),
                      labelText: "CPF *",
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: RosaApp)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple)),
                      hintStyle: TextStyle(color: Colors.white.withAlpha(80))

                  ),

                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Informe seu CPF';
                    }
                    return null;
                  },
                ),
              ),



              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.home, color: Colors.purple,),
                    Text("ENDEREÇO", style: TextStyle(color: Colors.purple, fontSize: 20),),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius:  BorderRadius.circular(3),
                    border: Border.all(color: Colors.grey),
                  color: Colors.white




                ),
                padding: const EdgeInsets.all(10.0),
                child: DropdownButton<Cidade>(

                  isDense: true,
                  elevation: 5,
                  isExpanded: true,
                  iconSize: 30,
                  style: TextStyle(fontSize: 15, color: RosaApp),
                  hint: Text("Cidade *", style: TextStyle(fontSize: 15, color: RosaApp)),
                  items:  _cidades.map((Cidade cidade) {
                    return new DropdownMenuItem<Cidade>(
                      value: cidade,
                      child: Text(cidade.nome),
                    );
                  }).toList(),
                  onChanged: (Cidade c) {
                    _setCidadeSelecionada(c);
                  },
                  value: _cidadeSelecionada,
                ),
              ),
              _cidadeSelecionada == null && _botaoPressionado ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text("Informe sua cidade", style: TextStyle(fontSize: 12, color: Colors.red[800
                ]),),
              ): Container(),



              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius:  BorderRadius.circular(3),
                    border: Border.all(color: Colors.grey),
                    color: Colors.white
                ),
                padding: const EdgeInsets.all(10.0),
                child: DropdownButton<Bairro>(
                  isDense: true,
                  elevation: 5,
                  isExpanded: true,
                  iconSize: 30,
                  style: TextStyle(fontSize: 15, color: RosaApp),
                  hint: Text("Bairro *", style: TextStyle(fontSize: 15, color: RosaApp)),
                  items: _bairros.map((Bairro bairro) {
                    return new DropdownMenuItem<Bairro>(
                      value: bairro,
                      child: Text(bairro.nome),
                    );
                  }).toList(),
                  onChanged: (Bairro b) {
                    _setBairroSelecionado(b);

                  },
                  value: _bairroSelecionado,
                ),
              ),

              _bairroSelecionado == null && _botaoPressionado ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text("Informe o bairro onde mora", style: TextStyle(fontSize: 12, color: Colors.red[800]),),
              ) : Container(),


              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _enderecoController,
                  keyboardType: TextInputType.text,
                  cursorColor: RosaApp,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: RosaApp),
                      labelText: "Logradouro *",
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: RosaApp)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple)),
                      hintStyle: TextStyle(color: Colors.white.withAlpha(80))

                  ), validator: (value) {
                  if (value.isEmpty) {
                    return 'Informe o logradouro';
                  }
                  return null;
                },

                ),
              ),


              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _numeroController,
                  keyboardType: TextInputType.text,
                  cursorColor: RosaApp,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: RosaApp),
                      labelText: "Número *",
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: RosaApp)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple)),
                      hintStyle: TextStyle(color: Colors.white.withAlpha(80))

                  ),    validator: (value) {
                  if (value.isEmpty) {
                    return 'Informe o número de sua casa';
                  }
                  return null;
                },

                ),
              ),


              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _complementoController,
                  keyboardType: TextInputType.text,
                  cursorColor: RosaApp,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: RosaApp),
                      labelText: "Complemento *",
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: RosaApp)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple)),
                      hintStyle: TextStyle(color: Colors.white.withAlpha(80))

                  ),
                  validator: (value) {
                  if (value.isEmpty) {
                    return 'Informe o complemento do endereço';
                  }
                  return null;
                },

                ),
              ),


              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _cepController,
                  keyboardType: TextInputType.numberWithOptions(signed: false),
                  cursorColor: RosaApp,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: RosaApp),
                      labelText: "CEP",
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: RosaApp)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple)),
                      hintStyle: TextStyle(color: Colors.white.withAlpha(80))

                  ),

                ),
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(



                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(


                    color: Colors.purple,
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                    ),

                    onPressed: () {

                      _botaoCadastrarPessoa(context);

                    },
                    child: Text('CADASTRAR', style: TextStyle( color: Colors.white,
                        fontSize: 20.0,
                        fontFamily: 'Reem Kufi')),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void _botaoCadastrarPessoa(BuildContext context) {

    setState(() {
      _botaoPressionado = true;
    });

    
    if (_formKey.currentState.validate() && _bairroSelecionado != null && _cidadeSelecionada != null) {


      EasyLoading.show(status: 'Cadastrando...');
      Pessoa p = new Pessoa();
      p.nome = _nomeController.text;
      p.nomeMae = _nomeMaeController.text;
      p.nomePai = _nomePaiController.text;
      p.idade = _idadeController.text;
      p.cpf = _cpfController.text;
      p.dataNascimento = _dataController.text;
      p.rg = _rgController.text;
      p.cidade = _cidadeSelecionada.nome;
      p.bairro = _bairroSelecionado.nome;
      p.cep = _cepController.text;
      p.endereco = _enderecoController.text;
      p.complemento = _complementoController.text;
      p.numero = _numeroController.text;

      CadastroApi.cadastroPessoa(p).then((value) {

        EasyLoading.dismiss();

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BotaoPanico()));

      });
    }
  }

  void _setCidadeSelecionada(Cidade c) {
    
    
    setState(() {
      this._cidadeSelecionada = c;

      _carregaBairros(c.id);


    });



  }

  void _setBairroSelecionado(Bairro b) {


    setState(() {
      this._bairroSelecionado = b;
    });


  }
}
