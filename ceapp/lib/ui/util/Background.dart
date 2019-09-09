import 'package:flutter/material.dart';

class Background {


  Widget setBack(int ri, int gi, int bi, int ai, int rf, int gf, int bf, int af ) {

    return   Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(ri, gi, bi, ai),
            Color.fromARGB(rf, gf, bf, af),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
    );
  }
}