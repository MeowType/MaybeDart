library meowtype.maybe.none;

import './maybe.dart';
import './impl.dart';

/// Means "no value"
class None<T> extends MaybeImpl<T> implements Maybe<T> {
  /// Create [None]
  const None();

  T get val => null;
  bool get has => false;
}
