import 'package:app_voco/product/services/api_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final tokenDataProvider = FutureProvider<String>((ref) async {
  return ref.watch(tokenProvider).getToken();
});