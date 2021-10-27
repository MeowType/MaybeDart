import "package:test/test.dart";

import 'package:some/index.dart';

void main() {
  group('create', () {
    test('Some', () {
      final some = Some(1);

      expect(some.has, isTrue);
      expect(some.val, equals(1));
    });

    test('None', () {
      final none = None();

      expect(none.has, isFalse);
      expect(none.val, isNull);
    });
  });

  group('when', () {
    test('Some', () {
      final some = Some(1);

      final when = some.when(some: (v) => true, none: () => false);

      expect(when.has, isTrue);
      expect(when.val, isTrue);
    });

    test('None', () {
      final none = None();

      final when = none.when(some: (v) => true, none: () => false);

      expect(when.has, isTrue);
      expect(when.val, isFalse);
    });
  });

  group('some', () {
    test('Some', () {
      final some = Some(1);

      final when = some.some((v) => true);

      expect(when.has, isTrue);
      expect(when.val, isTrue);
    });

    test('None', () {
      final none = None();

      final when = none.some((v) => true);

      expect(when.has, isFalse);
      expect(when.val, isNull);
    });
  });

  group('none', () {
    test('Some', () {
      final some = Some(1);

      final when = some.none(() => false);

      expect(when.has, isFalse);
      expect(when.val, isNull);
    });
    test('None', () {
      final none = None();

      final when = none.none(() => false);

      expect(when.has, isTrue);
      expect(when.val, isFalse);
    });
  });

  group('defaultVal', () {
    test('Some', () {
      final some = Some(1);

      final when = some.defaultVal(0);

      expect(when.has, isTrue);
      expect(when.val, equals(1));
    });

    test('None', () {
      final none = None();

      final when = none.defaultVal(true);

      expect(when.has, isTrue);
      expect(when.val, isTrue);
    });
  });

  group('defaultValFn', () {
    test('Some', () {
      final some = Some(1);

      final when = some.defaultValFn(() => 0);

      expect(when.has, isTrue);
      expect(when.val, equals(1));
    });

    test('None', () {
      final none = None();

      final when = none.defaultValFn(() => true);

      expect(when.has, isTrue);
      expect(when.val, isTrue);
    });
  });

  test('eq', () {
    final a = Some(1);
    final b = Some(1);
    final c = None();
    final d = None();
    
    expect(a == b, isTrue);
    expect(a == 1, isFalse);
    expect(c == d, isTrue);
  });

}
