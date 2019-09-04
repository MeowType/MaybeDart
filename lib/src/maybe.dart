library meowtype.maybe;

import './some.dart';
import './none.dart';

/// A pure virtual class that represents a union of "has value ([Some])" and "no value ([None])"
abstract class Maybe<T> {
  /// Create a [Some]
  const factory Maybe(T val) = Some<T>;

  /// Create a [Some]
  const factory Maybe.Some(T val) = Some<T>;

  /// Create a [None]
  const factory Maybe.None() = None<T>;

  /// Get the Value if it has
  T get val;

  /// Get whether it has Value
  bool get has;

  /// Pattern matching
  ///
  /// if [some] and [none] all null Return [None]
  ///
  /// else when it has return [Some(some(it))] or not has return [Some(none(it))]
  Maybe<R> when<R>({R some(T val), R none()});

  /// fMap
  ///
  /// When it has Value Return [Some(some(it))]
  ///
  /// otherwise return [None]
  Maybe<R> some<R>(R some(T val));

  /// When it not has Value Return [Some(none(it))]
  ///
  /// otherwise return [None]
  Maybe<R> none<R>(R none());

  /// Set a default value when it is [None]
  Some<T> defaultVal(T v);

  /// Set a default value when it is [None]
  ///
  /// but more lazy
  Some<T> defaultValFn(T fn());
}
