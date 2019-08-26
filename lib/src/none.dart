library meowtype.maybe.none;

import './maybe.dart';
import './some.dart';
import './impl.dart';

/// Means "no value"
class None<T> extends MaybeImpl<T> implements Maybe<T> {
  /// Create [None]
  const None();

  @override
  final T val = null;
  @override
  final bool has = false;

  @override
  Maybe<R> when<R>({R some(T val), R none()}) {
    if (none != null) return Some(none());
    some;
    return None();
  }

  @override
  Maybe<R> some<R>(R _(T val)) => None();

  @override
  Maybe<R> none<R>(R none()) => none != null ? Some(none()) : None();

  @override
  Some<T> defaultVal(T v) => Some(v);

  @override
  Some<T> defaultValFn(T fn()) => Some(fn());
}
