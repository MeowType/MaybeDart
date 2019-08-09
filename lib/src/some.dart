library meowtype.maybe.some;

import './maybe.dart';
import './impl.dart';

/// Means "has value"
class Some<T> extends MaybeImpl<T> implements Maybe<T> {
  final T _val;

  /// Create [Some]
  const Some(this._val);

  T get val => _val;
  bool get has => true;
}

