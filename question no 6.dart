Map<String, List<String>> invertMap(Map<String, List<String>> input) {
  Map<String, List<String>> inverted = {};

  input.forEach((key, values) {
    for (var value in values) {
      if (!inverted.containsKey(value)) {
        inverted[value] = [];
      }
      inverted[value]!.add(key);
    }
  });

  return inverted;
}
// 