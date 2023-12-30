import 'package:app_voco/pages/user_view/user_model.dart';
import 'package:app_voco/product/services/api_services.dart';
import 'package:riverpod/riverpod.dart';


final userDataProvider = FutureProvider<List<User>>((ref) async {
  return ref.watch(userProvider).getUsers();
});


