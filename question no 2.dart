List<int> flattenAndUnique(List<dynamic> input) {
  Set<int> result = {}; // To ensure uniqueness

  void helper(List<dynamic> items) {
    for (var item in items) {
      if (item is int) {
        result.add(item);
      } else if (item is List) {
        helper(item); // recursive call
      }
    }
  }

  helper(input);
  List<int> flattened = result.toList();
  flattened.sort();
  return flattened;
}
// 