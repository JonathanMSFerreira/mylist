import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'CeAppPage.dart';

class NewCePage extends StatefulWidget {
  @override
  _NewCePageState createState() => _NewCePageState();
}

class _NewCePageState extends State<NewCePage> {
  DateTime date1;
  DateTime date2;
  DateTime date3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Novo Ciclo de Estudos"),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        new Padding(padding: EdgeInsets.only(top: 40.0)),
                        new TextFormField(
                          decoration: new InputDecoration(
                            prefixIcon: Icon(Icons.refresh),
                            labelText: "Ciclo",
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(),
                            ),
                            //fillColor: Colors.green
                          ),
                          validator: (val) {
                            if (val.length == 0) {
                              return "O nome do ciclo não pode ser vazio!";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.text,
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        DateTimePickerFormField(
                          inputType: InputType.date,
                          format: DateFormat("dd/MM/yyyy"),
                          initialDate: DateTime.now(),
                          editable: false,
                          decoration: new InputDecoration(
                            labelText: "Início do ciclo",
                            prefixIcon: Icon(Icons.date_range),
                            hasFloatingPlaceholder: false,
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(),
                            ),
                            //fillColor: Colors.green
                          ),

                          //   locale: const Locale('BR') ,
                          onChanged: (dt) {
                            setState(() => date2 = dt);
                            print('Selected date: $date2');
                          },
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        DateTimePickerFormField(
                          inputType: InputType.date,
                          format: DateFormat("dd/MM/yyyy"),
                          initialDate: DateTime(2019, 1, 1),


                          decoration: new InputDecoration(
                            prefixIcon: Icon(Icons.date_range),
                            labelText: "Fim do ciclo",
                            hasFloatingPlaceholder: false,
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(),
                            ),
                            //fillColor: Colors.green
                          ),

                          //   locale: const Locale('BR') ,
                          onChanged: (dt) {
                            setState(() => date2 = dt);
                            print('Selected date: $date2');
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        RaisedButton(
                          color: Colors.deepPurple,
                          padding: EdgeInsets.only(
                              left: 80.0, bottom: 15.0, top: 15.0, right: 80.0),
                          child: new Text(
                            "Novo ciclo",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(25.0)),
                          onPressed: () {},
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => new CeAppPage()));
                          },
                          child: Text(
                            "Cancelar",
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      ]))),
        ));
  }
}
