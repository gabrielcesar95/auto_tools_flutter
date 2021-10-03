import 'package:flutter/material.dart';

class Breakpoints {
  static int sm = 640;
  static int md = 768;
  static int lg = 1024;
  static int xl = 1280;
  static int xxl = 1536;
}

class Responsive {
  BuildContext context;

  Responsive(this.context);

  int get gridTiles {
    if (MediaQuery.of(context).size.width < Breakpoints.sm) {
      return 2;
    }
    if (MediaQuery.of(context).size.width < Breakpoints.xl) {
      return 4;
    }
    return 6;
  }
}
