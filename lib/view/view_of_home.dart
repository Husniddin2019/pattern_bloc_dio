import 'package:flutter/material.dart';

import '../model/contacts.dart';

import 'item_of_post.dart';

Widget viewOfHome(List<Contacts> items, bool isLoading){
  return Stack(
    children: [
      ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx,index)
        {return itemofPost( ctx,items[index]);},
      ),
      isLoading ? Center(child: CircularProgressIndicator(),):SizedBox.shrink(),
    ],
  );
}