import 'package:flutter_test/flutter_test.dart';
import 'package:whatsapp_stacked/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('MessageDetailViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
