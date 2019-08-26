library meowtype.maybe.some;

import './maybe.dart';
import './none.dart';
import './impl.dart';

/// Means "has value"
class Some<T> extends MaybeImpl<T> implements Maybe<T> {
  /// Create [Some]
  const Some(this.val);

  @override
  final T val;
  @override
  final bool has = true;

  @override
  Maybe<R> when<R>({R some(T val), R none()}) {
    if (some != null) return Some(some(val));
    none;
    return None();
  }

  @override
  Maybe<R> some<R>(R some(T val)) => some != null ? Some(some(val)) : None();

  @override
  Maybe<R> none<R>(R _()) => None();

  @override
  Some<T> defaultVal(T _) => this;

  @override
  Some<T> defaultValFn(T _()) => this;
}
