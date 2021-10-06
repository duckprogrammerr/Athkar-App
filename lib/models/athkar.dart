class Athkar {
  final String category;
  final String count;
  final String des;
  final String reference;
  final String zekr;
  Athkar(this.category, this.count, this.des, this.reference, this.zekr);
  Athkar.fromJson(Map<String, String> json)
      : category = json['category']!,
        count = json['count']!,
        des = json['description']!,
        reference = json['reference']!,
        zekr = json['zekr']!;
}
