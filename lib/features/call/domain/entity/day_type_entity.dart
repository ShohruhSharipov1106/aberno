import 'package:equatable/equatable.dart';

class DayTypeEntity extends Equatable {
  final String name;
  final int id;
  const DayTypeEntity({required this.name, required this.id});

  @override
  List<Object?> get props => [name, id];
}
