library meowtype.maybe.some;

import './maybe.dart';

/// Means "has value"
class Some<T> with Maybe<T> implements Maybe<T> {
  final T _val;

  /// Create [Some]
  Some(this._val);

  T get val => _val;
  bool get has => true;
}

