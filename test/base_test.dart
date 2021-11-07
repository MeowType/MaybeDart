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
    final e = Some(Some(1));
    final f = Some(Some(1));
    final g = Some(None());
    final h = Some(None());

    expect(a == b, isTrue);
    expect(a == 1, isFalse);
    expect(c == d, isTrue);
    expect(e == f, isTrue);
    expect(e == a, isFalse);
    expect(e == c, isFalse);
    expect(g == h, isTrue);
    expect(e == g, isFalse);
    expect(a == g, isFalse);
    expect(c == g, isFalse);
  });

  group('is', () {
    test('Some', () {
      final some = Some(1);

      expect(some.isSome, isTrue);
      expect(some.isNone, isFalse);
    });

    test('None', () {
      final none = None();

      expect(none.isNone, isTrue);
      expect(none.isSome, isFalse);
    });
  });

  group('map', () {
    test('Some', () {
      final some = Some(1);

      final when = some.map((v) => true);

      expect(when.has, isTrue);
      expect(when.val, isTrue);
    });

    test('None', () {
      final none = None();

      final when = none.map((v) => true);

      expect(when.has, isFalse);
      expect(when.val, isNull);
    });
  });

  group('then', () {
    test('Some', () {
      final some = Some(1);

      final when = some.then((v) => true);

      expect(when.has, isTrue);
      expect(when.val, isTrue);
    });

    test('None', () {
      final none = None();

      final when = none.then((v) => true);

      expect(when.has, isFalse);
      expect(when.val, isNull);
    });
  });

  group('flatMap', () {
    test('Some', () {
      final some = Some(1);

      final when = some.flatMap((v) => Some(true));

      expect(when.has, isTrue);
      expect(when.val, isTrue);
    });

    test('None', () {
      final none = None();

      final when = none.flatMap((v) => Some(true));

      expect(when.has, isFalse);
      expect(when.val, isNull);
    });
  });

  group('andThen', () {
    test('Some', () {
      final some = Some(1);

      final when = some.andThen((v) => Some(true));

      expect(when.has, isTrue);
      expect(when.val, isTrue);
    });

    test('None', () {
      final none = None();

      final when = none.andThen((v) => Some(true));

      expect(when.has, isFalse);
      expect(when.val, isNull);
    });
  });

  group('and', () {
    test('Some', () {
      final some = Some(1);

      final when = some.and(Some(true));

      expect(when.has, isTrue);
      expect(when.val, isTrue);
    });

    test('None', () {
      final none = None();

      final when = none.and(Some(true));

      expect(when.has, isFalse);
      expect(when.val, isNull);
    });
  });

  group('or', () {
    test('Some', () {
      final some = Some(1);

      final when = some.or(Some(2));

      expect(when.has, isTrue);
      expect(when.val, 1);
    });

    test('None', () {
      final none = None();

      final when = none.or(Some(2));

      expect(when.has, isTrue);
      expect(when.val, 2);
    });
  });

  group('orElse', () {
    test('Some', () {
      final some = Some(1);

      final when = some.orElse(() => Some(2));

      expect(when.has, isTrue);
      expect(when.val, 1);
    });

    test('None', () {
      final none = None();

      final when = none.orElse(() => Some(2));

      expect(when.has, isTrue);
      expect(when.val, 2);
    });
  });

  group('xor', () {
    test('Some Some', () {
      final some = Some(1);

      final when = some.xor(Some(2));

      expect(when.has, isFalse);
      expect(when.val, isNull);
    });

    test('None None', () {
      final none = None();

      final when = none.or(None());

      expect(when.has, isFalse);
      expect(when.val, isNull);
    });

    test('Some None', () {
      final some = Some(1);

      final when = some.xor(None());

      expect(when.has, isTrue);
      expect(when.val, 1);
    });

    test('None Some', () {
      final none = None();

      final when = none.xor(Some(2));

      expect(when.has, isTrue);
      expect(when.val, 2);
    });
  });

  group('flatten', () {
    test('Some Some', () {
      final some = Some(Some(1));

      final when = some.flatten();

      expect(when.has, isTrue);
      expect(when.val, 1);
    });

    test('None', () {
      final none = None<Maybe>();

      final when = none.flatten();

      expect(when.has, isFalse);
      expect(when.val, isNull);
    });

    test('Some None', () {
      final some = Some(None());

      final when = some.flatten();

      expect(when.has, isFalse);
      expect(when.val, isNull);
    });
  });
}
