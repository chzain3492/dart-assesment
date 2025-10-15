// Higher-order function: memoize
Function(T) memoize<T, R>(R Function(T) f) {
  final cache = <T, R>{}; // Store previous results

  return (T arg) {
    if (cache.containsKey(arg)) {
      print('Returning cached result for $arg');
      return cache[arg]!;
    } else {
      print('Computing result for $arg');
      final result = f(arg);
      cache[arg] = result;
      return result;
    }
  };
}
// 