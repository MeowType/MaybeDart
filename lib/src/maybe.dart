library meowtype.maybe;

import 'package:some/src/hash.dart';

/// Means "has value"
class Some<T> {
  const Some(this.value);

  final T value;

  @override
  bool operator ==(other) => other is Some && other.val == val;

  static final _someHashCodeObj = Object();
  static int get _someHashCode => _someHashCodeObj.hashCode;

  @override
  int get hashCode => hash2(_someHashCode, this.val.hashCode);
}

/// Means "no value"
Maybe<T> None<T>() => null;

/// A pure virtual class that represents a union of "has value (Some)" and "no value (None)"
typedef Maybe<T> = Some<T>?;

/// Impl for Maybe
extension MaybeImpl<T> on Maybe<T> {
  T? get val => this == null ? null : this!.value;

  /// Get the Value if it has
  bool get has => this != null;

  /// Pattern matching
  ///
  /// if [some] and [none] all null Return None([null])
  ///
  /// else when it has return [Some(some(it))] or not has return [Some(none(it))]
  Maybe<R> when<R>({R some(T val)?, R none()?}) {
    if (this != null) {
      if (some != null) return Some(some(this!.value));
    } else {
      if (none != null) return Some(none());
    }
    return None<R>();
  }

  /// fMap
  ///
  /// When it has Value Return [Some(some(it))]
  ///
  /// otherwise return None([null])
  Maybe<R> some<R>(R some(T val)) {
    if (this != null) {
      return Some(some(this!.value));
    }
    return None();
  }

  /// When it not has Value Return [Some(none(it))]
  ///
  /// otherwise return None([null])
  Maybe<R> none<R>(R none()) {
    if (this == null) {
      return Some(none());
    }
    return None();
  }

  /// Set a default value when it is None([null])
  Maybe<T> defaultVal(T v) {
    if (this == null) {
      return Some(v);
    }
    return this;
  }

  /// Set a default value when it is None([null])
  ///
  /// but more lazy
  Maybe<T> defaultValFn(T fn()) {
    if (this == null) {
      return Some(fn());
    }
    return this;
  }
}
