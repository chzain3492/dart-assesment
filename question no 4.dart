String findTopRegion(Map<String, Map<String, List<int>>> salesData) {
  String topRegion = '';
  int maxSales = -1;

  salesData.forEach((region, products) {
    int regionTotal = 0;

    products.forEach((product, sales) {
      regionTotal += sales.fold(0, (sum, sale) => sum + sale);
    });

    if (regionTotal > maxSales) {
      maxSales = regionTotal;
      topRegion = region;
    }
  });

  return topRegion;
}
// 