import 'package:flutter_test/flutter_test.dart';
import 'package:payment_app/domain/provider/data_provider.dart';
import 'package:payment_app/domain/provider/loading_enum.dart';

import '../test_helper.dart';

void main() async {
  await TestHelper.setup();
  await TestHelper.initRepo();
  final provider = DataProvider();

  //Test on the method in the provider
  test('Enum Network State Test', () {
    final expected = RequestEnum.COMPLETE;
    provider.setEnum(RequestEnum.COMPLETE);
    expect(provider.requestEnum, expected);
  });
}
