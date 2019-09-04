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

import 'package:some/maybe.dart'; // only class Maybe
import 'package:some/some.dart'; // only class Some
import 'package:some/none.dart'; // only class None

import 'package:some/null.dart'; // only no null function
```


## Create

```dart
Maybe<int> some = Some(1);
```

```dart
Maybe<int> none = None();
```

```dart
Maybe<int> some = Maybe(1);
```

```dart
Maybe<int> some = Maybe.Some(1);
```

```dart
Maybe<int> none = Maybe.None();
```
## GetValue

```dart
if(some.has) {
    some.val
}
```

## Pattern matching
```dart
if(some is Some) {}
```

```dart
if(some is Some<int>) {}
```

```dart
if(some is None) {}
```

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