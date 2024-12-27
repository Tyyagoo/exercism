class PascalsTriangle {
  List<List<T>> zip<T>(List<T> a, List<T> b) {
    final int length = a.length < b.length ? a.length : b.length;
    final List<List<T>> result = [];
    for (int i = 0; i < length; i++) {
      result.add([a[i], b[i]]);
    }
    return result;
  }

  List<int> generateRow(List<int> previousRow) {
    /// IterableZip :(
    final middle = zip(previousRow, previousRow.skip(1).toList())
        .map((pair) => pair[0] + pair[1])
        .toList();
    return [1] + middle + [1];
  }

  List<List<int>> rows(int num) {
    final List<List<int>> acc = num > 0 ? [[1]] : [];
    for (int i = 1; i < num; i++) {
      acc.add(generateRow(acc.last));
    }
    return acc;
  }
}