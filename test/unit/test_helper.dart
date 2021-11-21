import 'package:flutter_test/flutter_test.dart';
import 'dart:io';

class TestHelper {
  static Future<void> setup() async {
    TestWidgetsFlutterBinding.ensureInitialized();
  }

  static Future<String> getFixturesContents(String fileName) async {
    File file;

    try {
      file = File('../test/unit/fixtures/$fileName');
      return await file.readAsString();
    } on FileSystemException {
      file = File('test/unit/fixtures/$fileName');
      return await file.readAsString();
    }
  }
}
