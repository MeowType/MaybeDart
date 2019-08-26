library meowtype.maybe.impl;

import './maybe.dart';
import './some.dart';
import './none.dart';

abstract class MaybeImpl<T> implements Maybe<T> {
  const MaybeImpl();

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
    if (this is Some) {
      if (other is T) {
        return this.val == other;
      } else if (other is Some<T>) {
        return this.val == other.val;
      }
    } else if (this is None && other is None) return true;
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
