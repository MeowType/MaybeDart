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

## Note
Compare the actual wrapped value when comparing  
This is useful in some cases, but you need to be careful when mixing the use of normal values and Maybe values, you need check it is Some  
```dart
Some(1) == 1
// true

None() == None()
// true
```