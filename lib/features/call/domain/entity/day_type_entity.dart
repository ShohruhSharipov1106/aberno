import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DayTypeEntity extends Equatable {
  final String name;
  final int id;
  final VoidCallback onTap;
  const DayTypeEntity({
    required this.name,
    required this.id,
    required this.onTap,
  });

  @override
  List<Object?> get props => [name, id];
}
