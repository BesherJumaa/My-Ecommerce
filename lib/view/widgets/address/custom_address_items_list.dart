import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomItemsAddressList extends StatelessWidget {
  final String name;
  final String country;
  final String governorate;
  final String city;
  final String street;

  final Function()? onEdit;
  final Function()? onRemove;

  const CustomItemsAddressList({
    Key? key,
    required this.name,
    required this.country,
    required this.governorate,
    required this.city,
    required this.street,
    required this.onEdit,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(children: [
        Expanded(
          flex: 3,
          child: ListTile(
            title: Text(name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            subtitle: Text("$country, $governorate \n $city, $street",
                style: const TextStyle(
                    color: AppColor.primaryColor, fontSize: 17)),
          ),
        ),
        Expanded(
            child: Column(
          children: [
            SizedBox(
                height: 40,
                child: IconButton(
                    onPressed: onEdit,
                    icon: const Icon(
                      Icons.edit,
                      color: AppColor.primaryColor,
                    ))),
            SizedBox(
                height: 30,
                child: IconButton(
                    onPressed: onRemove,
                    icon: const Icon(
                      Icons.delete,
                      color: AppColor.primaryColor,
                    )))
          ],
        ))
      ]),
    );
  }
}
