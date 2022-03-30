import 'package:equatable/equatable.dart';

class CuratedUrls extends Equatable {
  final String raw;
  final String full;
  final String regular;
  final String small;
  final String smallS3;

  const CuratedUrls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.smallS3,
  });

  @override
  List<Object?> get props => [raw, full, regular, small, smallS3];
}
