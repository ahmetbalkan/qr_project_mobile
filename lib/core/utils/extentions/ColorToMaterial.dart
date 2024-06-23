import 'package:flutter/material.dart';

extension ToMaterialStateProperty<T> on T {
  MaterialStateProperty<T> toMaterialStateProperty() {
    return MaterialStateProperty.all(this);
  }
}
