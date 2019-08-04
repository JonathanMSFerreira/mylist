final String itemTable = "itemTable";
final String idItemColumn = "idItemColumn";
final String nameItemColumn = "nameItemColumn";
final String okColumn = "okColumn";
final String qtdColumn = "qtdColumn";

final String medidaColumn = "medidaColumn";
final String fkCompraColumn = "fkCompraColumn";



class Item {

  int idItem;
  String medidaItem;
  String qtdItem;
  String nameItem;
  bool ok ;
  int fkCompra;


  Item();


  Item.fromMap(Map map) {

    idItem = map[idItemColumn];
    nameItem = map[nameItemColumn];
    qtdItem = map[qtdColumn];
    medidaItem = map[medidaColumn];
    ok = map[okColumn] == 1;
    fkCompra = map[fkCompraColumn];

  }



  Map toMap() {

      Map<String, dynamic> map = {

        qtdColumn: qtdItem,
        medidaColumn: medidaItem,
      nameItemColumn: nameItem,
      okColumn: ok == true  ? 1 : 0,
      fkCompraColumn: fkCompra,

    };

    if (idItem != null) {
      map[idItemColumn] = idItem;
    }

    return map;
  }

  @override
  String toString() {

    return "Item(idItem: $idItem, name: $nameItem, quantidade: $qtdItem,medida: $medidaItem, ok: $ok, fkCompra: $fkCompra)";

  }


}
