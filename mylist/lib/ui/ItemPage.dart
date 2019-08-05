import 'package:flutter/material.dart';
import 'package:mylist/helper/ListaComprasHelper.dart';
import 'package:mylist/model/Compra.dart';
import 'package:mylist/model/Item.dart';

class ItemPage extends StatefulWidget {
  Compra compra;

  ItemPage(Compra compra) {
    this.compra = compra;
  }

  @override
  _ItemPageState createState() => _ItemPageState(compra);
}

class _ItemPageState extends State<ItemPage> {
  Compra compra;

  Item _editedItem;

  final _nameController = TextEditingController();
  final _qtdController = TextEditingController();

  var medidaSelecionada;
  final _nameFocus = FocusNode();

  var _sizeItens;

  _ItemPageState(Compra compra) {
    this.compra = compra;
  }

  @override
  void initState() {
    _editedItem = Item();
    _getAllItens(compra.id);
    _getSize(compra.id);

    super.initState();
  }

  CompraHelper helper = new CompraHelper();

  List<Item> listaItens = List();

  List<String> _locations = ['kg', 'l', 'g', 'mg', 'T', 'ml'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(compra.name),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
          // action button
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _nameController.text = '';
          _qtdController.text = '';
          _editedItem.ok = false;
          _dialogAdicionaItem(compra.id, context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: _sizeItens.toString()  != '0'
                  ? RefreshIndicator(
                      onRefresh: _ordenar,
                      child: ListView.builder(
                          padding: EdgeInsets.all(1.0),
                          itemCount: listaItens.length,
                          itemBuilder: (context, index) {
                            return _cardItem(context, index);
                          }),
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset("images/bck_carrinho.png",
                              color: Color.fromRGBO(255, 255, 255, 0.5),
                              colorBlendMode: BlendMode.modulate),
                          Text(
                            "Nenhum item na lista!",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: 20.0),
                          )
                        ],
                      ),
                    )),
        ],
      ),
    );
  }

  void _getAllItens(int id) {
    helper.getAllItens(id).then((list) {
      setState(() {
        listaItens = list;
      });
    });
  }

  Widget _cardItem(BuildContext context, int index) {
    String _qtdMedida = "";

    _qtdMedida += listaItens[index].qtdItem == null
        ? ""
        : listaItens[index].qtdItem.toString();

    _qtdMedida += ' '+listaItens[index].medidaItem ?? "";

    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: Column(
        children: <Widget>[
          CheckboxListTile(
            title: Text(listaItens[index].nameItem ?? "",
                style: listaItens[index].ok == false
                    ? TextStyle(
                        fontSize: 20.0,

                      )
                    : TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.black,
                  decorationStyle: TextDecorationStyle.solid,

                )),
            value: listaItens[index].ok,
            secondary: Container(
                child: Text(
              _qtdMedida,
              style: TextStyle(fontSize: 20.0),
            )),
            onChanged: (c) {
              setState(() {
                listaItens[index].ok = c;
                helper.updateItem(listaItens[index]);
              });
            },
          ),
          Divider(
            height: 1,
          )
        ],
      ),
      onDismissed: (direction) {
        helper.deleteItem(listaItens[index].idItem);
        _getAllItens(compra.id);
        _getSize(compra.id);
      },
    );
  }

  void _dialogAdicionaItem(int id, BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Novo item"),
          content: SingleChildScrollView(
              child: Container(
                  child: Center(
                      child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _nameController,
                focusNode: _nameFocus,
                decoration: new InputDecoration(
                  labelText: "Nome",
                  fillColor: Colors.white,

                  //fillColor: Colors.green
                ),
                onChanged: (text) {
                  setState(() {
                    _editedItem.nameItem = text;
                  });
                },
              ),
              TextField(
                controller: _qtdController,
                decoration: new InputDecoration(
                  labelText: "Quantidade",
                  fillColor: Colors.white,

                  //fillColor: Colors.green
                ),
                keyboardType: TextInputType.numberWithOptions(
                    decimal: false, signed: false),
                onChanged: (text) {
                  setState(() {
                    _editedItem.qtdItem = text;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              DropdownButton(
                isExpanded: true,
                hint: Text('Unidade de medida'), // Not necessary for Option 1
                value: medidaSelecionada,

                onChanged: (newValue) {
                  setState(() {
                    _editedItem.medidaItem = newValue;

                    medidaSelecionada = newValue;
                  });
                },
                items: _locations.map((medida) {
                  return DropdownMenuItem(
                    child: new Text(medida),
                    value: medida,
                  );
                }).toList(),
              ),
            ],
          )))),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text(
                "Cancelar",
                style: TextStyle(color: Colors.grey[400]),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),

            new RaisedButton(
              child: new Text(
                "Novo",
                style: TextStyle(color: Colors.white),
              ),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              onPressed: () {
                if (_editedItem.nameItem != null &&
                    _editedItem.nameItem.isNotEmpty) {
                  _editedItem.fkCompra = compra.id;
                  _editedItem.ok = false;
                  helper.saveItem(_editedItem);
                  _editedItem = Item();
                  _editedItem.ok = false;
                  _nameController.text = "";
                  Navigator.pop(context, _editedItem);
                  _getAllItens(compra.id);
                  _getSize(compra.id);
                } else {
                  FocusScope.of(context).requestFocus(_nameFocus);
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _getSize(int fkCompra) {
    helper.getSizeItem(fkCompra).then((size) {
      setState(() {
        _sizeItens = size.toString();
      });
    });
  }

  Future<Null> _ordenar() async {
    await Future.delayed(Duration(seconds: 1));

    helper.getOrderItens(compra.id).then((list) {
      setState(() {
        listaItens = list;
      });
    });

    return null;
  }
}
