library meowtype.maybe.some;

import './maybe.dart';
import './none.dart';
import './hash.dart';

/// Means "has value"
class Some<T> implements Maybe<T> {
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

  @override
  bool operator ==(other) => other is Some && other.val == val;

  static final _someHashCodeObj = Object();
  static int get _someHashCode => _someHashCodeObj.hashCode;

  @override
  int get hashCode => hash2(_someHashCode, this.val.hashCode);
}
