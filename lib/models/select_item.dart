import 'package:flutter/painting.dart';


class SelectItem {
  final String id;
  final String name;
  final Color color;


  SelectItem({
    required this.id,
    required this.name,
    required this.color,
  });

  SelectItem copyWith({
    String? id,
    String? name,
    Color? color,
  }) {
    return SelectItem(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }
}