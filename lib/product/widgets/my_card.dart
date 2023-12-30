import 'package:app_voco/pages/user_view/user_model.dart';
import 'package:app_voco/product/utility/constants/constant_color.dart';
import 'package:app_voco/product/utility/constants/constant_padding.dart';
import 'package:flutter/material.dart';

class myCard extends StatelessWidget {
  const myCard({
    super.key,
    required this.userList,
    required this.index
  });

  final List<User> userList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: ConstantColor.cardColor,
        elevation: 4,
        margin: ConstantPadding.mediumSymetricPadding,
        child: ListTile(
          title: Text(userList[index].firstName,
              style: const TextStyle(color: ConstantColor.textColor)),
          subtitle: Text(userList[index].lastName,
              style: const TextStyle(color: ConstantColor.textColor)),
          trailing: CircleAvatar(
            backgroundImage: NetworkImage(userList[index].avatar),
          ),
        ));
  }
}