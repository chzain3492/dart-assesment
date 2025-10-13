List<int> flattenAndUnique(List<dynamic> input) {
  Set<int> result = {}; // ensures uniqueness

  void helper(List<dynamic> items) {
    for (var item in items) {
      if (item is int) {
        result.add(item);       // add integer directly
      } else if (item is List) {
        helper(item);           // recursively flatten nested list
      }
    }
  }

  helper(input);

  List<int> flattened = result.toList();
  flattened.sort(); // sort ascending
  return flattened;
}
// 