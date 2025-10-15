Map<String, dynamic> deepMerge(Map<String, dynamic> map1, Map<String, dynamic> map2) {
  Map<String, dynamic> result = {};

  // Add all keys from map1
  for (var key in map1.keys) {
    result[key] = map1[key];
  }

  // Merge keys from map2
  for (var key in map2.keys) {
    if (result.containsKey(key) &&
        result[key] is Map &&
        map2[key] is Map) {
      // Recursively merge nested maps
      result[key] = deepMerge(
        Map<String, dynamic>.from(result[key]),
        Map<String, dynamic>.from(map2[key]),
      );
    } else {
      // Overwrite with map2's value
      result[key] = map2[key];
    }
  }

  return result;
}

void main() {
  Map<String, dynamic> mapA = {
    'name': 'John',
    'details': {
      'age': 25,
      'address': {'city': 'New York', 'zip': '10001'}
    },
    'hobbies': ['reading']
  };

  Map<String, dynamic> mapB = {
    'details': {
      'age': 30,
      'address': {'zip': '10002', 'street': '5th Ave'}
    },
    'hobbies': ['coding'],
    'active': true
  };

  Map<String, dynamic> merged = deepMerge(mapA, mapB);
  print(merged);
}
// 