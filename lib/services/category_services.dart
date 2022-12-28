import 'package:auth2/models/category.dart';
import 'package:auth2/repositories/repository.dart';

class CategoryService {
  late Repository _repository;
  CategoryService() {
    _repository = Repository();
  }

  saveCategory(Category category) async {
    return await _repository.insertData('categories', category.categoryMap());
  }

  readCategories() async {
    return await _repository.readData('categories');
  }
}
