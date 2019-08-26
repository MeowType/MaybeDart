library meowtype.maybe.nullable;

import './maybe.dart';
import './some.dart';
import './none.dart';

/// Pattern matching
///
/// if [some] and [none] all null Return [None]
///
/// else when it has return [Some(some(it))] or not has return [Some(none(it))]
Maybe<R> when<T, R>(Maybe<T> self, {R some(T val), R none()}) {
  if (self is Some) {
    if (some != null) return Some(some(self.val));
  } else {
    if (none != null) return Some(none());
  }
  return None();
}

/// fMap
///
/// When it has Value Return [Some(some(it))]
///
/// otherwise return [None]
Maybe<R> some<T, R>(Maybe<T> self, R some(T val)) {
  if (self is Some) {
    if (some != null) return Some(some(self.val));
  }
  return None();
}

/// When it not has Value Return [Some(none(it))]
///
/// otherwise return [None]
Maybe<R> none<T, R>(Maybe<T> self, R Function() none) {
  if (self is None) {
    if (none != null) return Some(none());
  }
  return None();
}

/// Set a default value when it is [None]
Some<T> defaultVal<T>(Maybe<T> self, T v) {
  if (self is None) {
    return Some(v);
  }
  return self;
}

/// Set a default value when it is [None]
///
/// but more lazy
Some<T> defaultValFn<T>(Maybe<T> self, T fn()) {
  if (self is None) {
    return Some(fn());
  }
  return self;
}
