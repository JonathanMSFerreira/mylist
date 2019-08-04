final String compraTable = "compraTable";
final String idColumn = "idColumn";
final String nameColumn = "nameColumn";
final String dateColumn = "dateColumn";



class Compra {

  int id;
  String name;
  String date;



  Compra();


  Compra.fromMap(Map map) {

    id = map[idColumn];
    name = map[nameColumn];
    date = map[dateColumn];

  }


  Map toMap() {
    Map<String, dynamic> map = {
      nameColumn: name,
      dateColumn: date,

    };

    if (id != null) {
      map[idColumn] = id;
    }

    return map;
  }

  @override
  String toString() {

    return "Compra(id: $id, name: $name, date: $date)";

  }


}
