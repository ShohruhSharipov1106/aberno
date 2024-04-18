import 'package:equatable/equatable.dart';

class SlideEntity extends Equatable {
  final String label;
  final String subLabel;

  const SlideEntity({
    required this.label,
    required this.subLabel,
  });

  @override
  List<Object?> get props => [label, subLabel];
}
