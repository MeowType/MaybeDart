library meowtype.maybe.none;

import './maybe.dart';

/// Means "no value"
class None<T> with Maybe<T> implements Maybe<T> {
  /// Create [None]
  None();

  T get val => null;
  bool get has => false;
}
