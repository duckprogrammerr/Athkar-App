import '../data/athkar_rep.dart';
import '../models/athkar.dart';

class AthkarListViewModel {
  List<Athkar> _athkarList = [];

  getAthkarsByCategory(String category) {
    return db
        .where((element) => element.containsValue(category))
        .forEach((element) => _athkarList.add(Athkar.fromJson(element)));
  }

  List<Athkar> get athkarList => _athkarList;
}
