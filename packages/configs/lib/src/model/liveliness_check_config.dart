import 'package:meta/meta.dart';

@immutable
class LivelinessCheckConfig {
  LivelinessCheckConfig({
    required this.photoPath,
  });

  final String photoPath;
}
