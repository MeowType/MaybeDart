### Some / Maybe / Option / Result / Nullable

#### **Can avoid semantic confusion caused by returning null when returning a value**

like Haskel Maybe

---

[![pub](https://img.shields.io/pub/v/some.svg)](https://pub.dev/packages/some) [![MIT](https://img.shields.io/github/license/MeowType/MaybeDart)](https://github.com/MeowType/MaybeDart/blob/master/LICENSE)

---

# Usage

## Import

```dart
import 'package:some/index.dart'; // import all
```

## Create

```dart
Maybe<int> some = Some(1);
```

```dart
Maybe<int> none = None();
```

## Switch (dart > 3.0.0)

```dart
Maybe<int> some = Some(1);

var a = switch (some) {
    Some(v: var v) => v,
    null => 0
};
```

## Check has value

```dart
some.isSome
none.isNone
some.has
```

## Get value

```dart
if(some.has) {
    some.val!
}
```

## Monadic

```dart
some.map((v) => 'some');
some.then((v) => 'some');
```

```dart
some.flatMap((v) => Some('some'));
some.andThen((v) => Some('some'));
```

## Logical

```dart
some.and(Some('some'));
some.andThen((v) => Some('some'));
```

```dart
some.or(Some('some'));
some.orElse(() => Some('some'));
```

```dart
some.xor(Some('some'));
```

## Flatten

```dart
someSome.flatten();
```

## Pattern matching

```dart
some.when(some: (v) => 'some', none: () => 'none');
```

```dart
some.some((v) => 'some');
```

```dart
none.none(() => 'none');
```

```dart
none.defaultVal('none');
```

```dart
none.defaultValFn(() => 'none');
```
