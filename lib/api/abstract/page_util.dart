class PageInfo {
  final int pageNum;
  final int pageSize;

  const PageInfo({
    required this.pageNum,
    required this.pageSize,
  });

  Map<String, dynamic> toJson() {
    return {
      'pageNum': pageNum,
      'pageSize': pageSize,
    };
  }

  factory PageInfo.fromJson(Map<String, dynamic> json) {
    return PageInfo(
      pageNum: json['pageNum'],
      pageSize: json['pageSize'],
    );
  }

  void addTo(Map<String, dynamic> json) {
    json.addAll(toJson());
  }
}
