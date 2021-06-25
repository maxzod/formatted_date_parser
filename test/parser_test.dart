import 'package:light_date_parser/helpers.dart';
import 'package:test/test.dart';

void main() {
  group('mid night prser', () {
    test('am test', () {
      final date = '05 Jun. 2021 | 12:53am';
      final parsedDate = parse(date);
      expect(parsedDate.hour, equals(0));
      expect(parsedDate.day, equals(5));
    });
    test('pm test', () {
      final date = '05 Jun. 2021 | 12:53pm';
      final parsedDate = parse(date);
      expect(parsedDate.hour, equals(12));
      expect(parsedDate.day, equals(5));
    });
  });
}
