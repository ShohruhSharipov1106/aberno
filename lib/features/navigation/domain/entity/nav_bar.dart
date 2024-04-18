import 'package:equatable/equatable.dart';

class NavBar extends Equatable {
  final int id;
  final String icon;
  final bool isCenter;

  const NavBar({
    required this.id,
    required this.icon,
    this.isCenter = false,
  });

  @override
  List<Object?> get props => [id, icon, isCenter];
}
