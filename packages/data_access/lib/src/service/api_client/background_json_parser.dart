import 'dart:convert';
import 'dart:isolate';

typedef ParserCallback<T> = T Function(Map<String, dynamic> data);

class BackgroundJsonParser<T> {
  const BackgroundJsonParser(
    this.encodedJson,
    this.onParse,
  );

  final String encodedJson;
  final ParserCallback<T> onParse;

  Future<T> parseInBackground() async {
    final p = ReceivePort();
    await Isolate.spawn(_decodeAndParse, p.sendPort);

    return await p.first;
  }

  Future<void> _decodeAndParse(SendPort p) async {
    final decodedJson = jsonDecode(encodedJson);
    final parsedData = onParse(decodedJson);
    Isolate.exit(p, parsedData);
  }
}
