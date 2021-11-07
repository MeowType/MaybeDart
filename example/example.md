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
