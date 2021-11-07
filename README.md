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

## GetValue

```dart
if(some.has) {
    some.val
}
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
