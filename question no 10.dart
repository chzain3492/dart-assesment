import 'dart:async';

// private in-memory cache map
final Map<String, Future<String>> _cache = {};

// simulated async network call
Future<String> _fetchFromNetwork(String key) async {
  print("Fetching from network for key: $key");
  await Future.delayed(Duration(seconds: 2)); // simulate network delay
  return "Data for $key";
}

// function with caching mechanism
Future<String> getCachedData(String key) {
  // if data already in cache, return existing Future
  if (_cache.containsKey(key)) {
    print("Returning cached data for key: $key");
    return _cache[key]!;
  }

  // if not in cache, fetch and store the Future
  final future = _fetchFromNetwork(key);
  _cache[key] = future;
  return future;
}
