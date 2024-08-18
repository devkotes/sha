import 'package:equatable/equatable.dart';

class Onboard extends Equatable {
  final int index;
  final String title;
  final String subtitle;
  final String imgAsset;

  const Onboard({
    required this.index,
    required this.title,
    required this.subtitle,
    required this.imgAsset,
  });

  @override
  List<Object?> get props => [index, title, subtitle, imgAsset];
}
