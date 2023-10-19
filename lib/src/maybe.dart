library meowtype.maybe;

import 'package:some/src/hash.dart';

/// Means "has value"
class Some<T> {
  const Some(this.value);

  final T value;

  T get v => this.value;

  @override
  bool operator ==(other) => other is Some && other.val == val;

  static final _someHashCodeObj = Object();
  static int get _someHashCode => _someHashCodeObj.hashCode;

  @override
  int get hashCode => hash2(_someHashCode, this.val.hashCode);
}

/// Means "no value"
Maybe<T> None<T>() => null;

/// A type alias represents a union of "has value (Some)" and "no value (None)"
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
    if (this != null) return Some(some(this!.value));
    return None();
  }

  /// When it not has Value Return [Some(none(it))]
  ///
  /// otherwise return None([null])
  Maybe<R> none<R>(R none()) {
    if (this == null) return Some(none());
    return None();
  }

  /// Set a default value when it is None([null])
  Maybe<T> defaultVal(T v) {
    if (this == null) return Some(v);
    return this;
  }

  /// Set a default value when it is None([null])
  ///
  /// but more lazy
  Maybe<T> defaultValFn(T fn()) {
    if (this == null) return Some(fn());
    return this;
  }

  /// Returns true if the this is a Some value
  bool get isSome => this != null;

  /// Returns true if the this is a None value
  bool get isNone => this == null;

  /// Maps an Maybe<T> to Maybe<U> by applying a function to a contained value
  Maybe<U> map<U>(U f(T val)) {
    if (this != null) return Some(f(this!.value));
    return None();
  }

  /// Maps an Maybe<T> to Maybe<U> by applying a function to a contained value
  Maybe<U> then<U>(U f(T val)) {
    if (this != null) return Some(f(this!.value));
    return None();
  }

  /// Returns None if the this is None, otherwise returns other
  Maybe<U> and<U>(Maybe<U> other) {
    if (this == null) return None();
    return other;
  }

  /// Returns None if the this is None, otherwise calls f with the wrapped value and returns the result
  Maybe<U> flatMap<U>(Maybe<U> f(T val)) {
    if (this != null) return f(this!.value);
    return None();
  }

  /// Returns None if the this is None, otherwise calls f with the wrapped value and returns the result
  Maybe<U> andThen<U>(Maybe<U> f(T val)) {
    if (this != null) return f(this!.value);
    return None();
  }

  /// Returns this if this contains a value, otherwise returns other
  Maybe<T> or(Maybe<T> other) {
    if (this == null) return other;
    return this;
  }

  /// Returns this if this contains a value, otherwise calls f and returns the result
  Maybe<T> orElse(Maybe<T> f()) {
    if (this == null) return f();
    return this;
  }

  /// Returns Some if exactly one of this, other is Some, otherwise returns None
  Maybe<T> xor(Maybe<T> other) {
    if (this != null && other == null) return this;
    if (this == null && other != null) return other;
    return None();
  }
}

/// Impl for Maybe
extension FlattenMaybeImpl<T> on Maybe<Maybe<T>> {
  /// Converts from `Maybe<Maybe<T>>` to `Maybe<T>`
  Maybe<T> flatten() {
    if (this == null)
      return None();
    else
      return this!.value;
  }
}
