import "package:test/test.dart";

import 'package:some/index.dart';

void main() {

  group('when', () {
    test('Some', () {
      final some = Some(1);

      final w = when(some, some: (v) => true, none: () => false);

      expect(w.has, isTrue);
      expect(w.val, isTrue);
    });

    test('None', () {
      final none = None();

      final w = when(none, some: (v) => true, none: () => false);

      expect(w.has, isTrue);
      expect(w.val, isFalse);
    });
  });

  group('some', () {
    test('Some', () {
      final s = Some(1);

      final when = some(s, (v) => true);

      expect(when.has, isTrue);
      expect(when.val, isTrue);
    });

    test('None', () {
      final none = None();

      final when = some(none, (v) => true);

      expect(when.has, isFalse);
      expect(when.val, isNull);
    });
  });

  group('none', () {
    test('Some', () {
      final some = Some(1);

      final when = none(some, () => false);

      expect(when.has, isFalse);
      expect(when.val, isNull);
    });
    test('None', () {
      final n = None();

      final when = none(n, () => false);

      expect(when.has, isTrue);
      expect(when.val, isFalse);
    });
  });

  group('defaultVal', () {
    test('Some', () {
      final some = Some(1);

      final when = defaultVal(some, 0);

      expect(when.has, isTrue);
      expect(when.val, equals(1));
    });

    test('None', () {
      final none = None();

      final when = defaultVal(none, true);

      expect(when.has, isTrue);
      expect(when.val, isTrue);
    });
  });

  group('defaultValFn', () {
    test('Some', () {
      final some = Some(1);

      final when = defaultValFn(some, () => 0);

      expect(when.has, isTrue);
      expect(when.val, equals(1));
    });

    test('None', () {
      final none = None();

      final when = defaultValFn(none, () => true);

      expect(when.has, isTrue);
      expect(when.val, isTrue);
    });
  });
}
