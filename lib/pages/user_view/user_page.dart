import 'package:app_voco/pages/user_view/user_model.dart';
import 'package:app_voco/product/providers/user_provider.dart';
import 'package:app_voco/product/utility/constants/constant_padding.dart';
import 'package:app_voco/product/utility/constants/constant_string.dart';
import 'package:app_voco/product/widgets/my_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UsersPage extends ConsumerWidget {
  const UsersPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text(ConstantString.usersPageTitle)),
      ),
      body: _data.when(
        data: (_data) {
          List<User> userList = _data.map((e) => e).toList();
          return Padding(
            padding: ConstantPadding.mediumAllPadding,
            child: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                        itemCount: userList.length,
                        itemBuilder: (_, index) {
                          return myCard(userList: userList,index: index);
                        }))
              ],
            ),
          );
        },
        error: (error, s) => Text(error.toString()),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}


