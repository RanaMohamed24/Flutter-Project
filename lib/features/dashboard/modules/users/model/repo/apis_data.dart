import 'package:flutter_project/features/dashboard/modules/users/model/user_model.dart';

import 'parent_data.dart';

class APIsRepo extends ParentRepo {
  @override
  Future<void> delete({required int id}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> fetch() {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  @override
  Future<void> insert({required String name, String? address}) {
    // TODO: implement insert
    throw UnimplementedError();
  }
}
