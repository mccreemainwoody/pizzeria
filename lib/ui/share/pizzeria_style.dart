import 'dart:ui';
import 'package:flutter/material.dart';

class PizzeriaStyle{
  static final baseTextStyle = const TextStyle(fontWeight: FontWeight.bold);

  static final TextStyle pageTitleTextStyle = baseTextStyle.copyWith(
    fontSize: 26.0,
  );
  static final TextStyle headerTextStyle = baseTextStyle.copyWith(
    fontSize: 20.0,
  );
  static final TextStyle regularTextStyle = baseTextStyle.copyWith(
    fontSize: 18.0,
  );
  static final TextStyle subHeaderTextStyle = baseTextStyle.copyWith(
    fontSize: 26.0,
  );

  static final TextStyle itemPriceTextStyle = const TextStyle(color: Colors.blueGrey);
  static final TextStyle subPriceTextStyle = itemPriceTextStyle.copyWith(
    fontSize: 20.0,
    color: Colors.indigo,
  );
  static final TextStyle priceSubTotalTextStyle = itemPriceTextStyle.copyWith(
    fontSize: 20.0,
    color: Colors.blueGrey,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle priceTotalTextStyle = itemPriceTextStyle.copyWith(
    fontSize: 22.0,
    color: Colors.indigo,
  );

  static final TextStyle errorTextStyle = baseTextStyle.copyWith(
    color: Colors.red,
    fontSize: 22.0,
  );
}
