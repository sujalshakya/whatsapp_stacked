import 'package:flutter_test/flutter_test.dart';
import 'package:whatsapp_stacked/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('FetchUserServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
