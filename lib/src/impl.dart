library meowtype.maybe.impl;

import './maybe.dart';
import './some.dart';
import './none.dart';

abstract class MaybeImpl<T> implements Maybe<T> {
  const MaybeImpl();

  /// Get the Value if it has
  T get val;

  /// Get whether it has Value
  bool get has;

  /// Pattern matching
  ///
  /// if [some] and [none] all null Return [None]
  ///
  /// else when it has return [Some(some(it))] or not has return [Some(none(it))]
  Maybe<R> when<R>({R some(T), R none()}) {
    if (has) {
      if (some != null) return Some(some(val));
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
  Maybe<R> some<R>(R some(T val)) {
    if (has) {
      if (some != null) return Some(some(val));
    }
    return None();
  }

  /// When it not has Value Return [Some(none(it))]
  ///
  /// otherwise return [None]
  Maybe<R> none<R>(R Function() none) {
    if (!has) {
      if (none != null) return Some(none());
    }
    return None();
  }

  /// Set a default value when it is [None]
  Some<T> defaultVal(T v) {
    if (!has) {
      return Some(v);
    }
    return this;
  }

  /// Set a default value when it is [None]
  ///
  /// but more lazy
  Some<T> defaultValFn(T fn()) {
    if (!has) {
      return Some(fn());
    }
    return this;
  }

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
  bool operator ==(other) {
    if (other is Maybe) {
      if (this is Some) {
        if (other is T) {
          return this.val == other;
        } else if (other is Some<T>) {
          return this.val == other.val;
        }
      } else if (this is None && other is None) return true;
    }
    return false;
  }

  static final _noneHashCodeObj = Object();
  static int get _noneHashCode => _noneHashCodeObj.hashCode;

  @override
  int get hashCode {
    if (this is None) {
      return _noneHashCode;
    } else {
      return this.val.hashCode;
    }
  }
}
