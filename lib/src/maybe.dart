library meowtype.maybe;

import './some.dart';
import './none.dart';

/// A pure virtual class that represents a union of "has value ([Some])" and "no value ([None])"
abstract class Maybe<T> {
  /// Create a [Some]
  const factory Maybe(T val) = Some;

  /// Create a [Some]
  const factory Maybe.Some(T val) = Some;

  /// Create a [None]
  const factory Maybe.None() = None;

  /// Get the Value if it has
  T get val;

  /// Get whether it has Value
  bool get has;

  /// Pattern matching
  ///
  /// if [some] and [none] all null Return [None]
  ///
  /// else when it has return [Some(some(it))] or not has return [Some(none(it))]
  Maybe<R> when<R>({R some(T), R none()});

  /// fMap
  ///
  /// When it has Value Return [Some(some(it))]
  ///
  /// otherwise return [None]
  Maybe<R> some<R>(R some(T val));

  /// When it not has Value Return [Some(none(it))]
  ///
  /// otherwise return [None]
  Maybe<R> none<R>(R Function() none);

  /// Set a default value when it is [None]
  Maybe<V> defaultVal<V>(V v);

  /// Set a default value when it is [None]
  ///
  /// but more lazy
  Maybe<V> defaultValFn<V>(V fn());

  /// The equality operator.
  ///
  /// If [other] is Value will compare the this value with other
  ///
  /// If both sides are [Some] will compare the values of 2 sides
  ///
  /// Or both sides are [None] will return true
  ///
  /// Others are false
  @override
  bool operator ==(other);

  @override
  int get hashCode;
}
