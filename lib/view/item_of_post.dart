
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pattern_bloc/block/list_post_cubic.dart';
import '../model/contacts.dart';

Widget itemofPost( BuildContext context,Contacts contacts){
  return Slidable(
    child: Container(
      height: 100,
      padding: EdgeInsets.only(left: 10,right: 10,top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            //color: Colors.teal,
            child: Text(
              contacts.fullname!.toUpperCase(),
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
            ),),
          SizedBox(width: 5,),
          Container( child: Text(contacts.phone!),),
        ],
      ),
    ),
    startActionPane: ActionPane(
    // A motion is a widget used to control how the pane animates.
    motion:  ScrollMotion(),


    children:  [
      // A SlidableAction can have an icon and/or a label.
      SlidableAction(
        onPressed: (BuildContext context){
        BlocProvider.of<ListPostCubit>(context).apiPostDelete(contacts);
          },
        backgroundColor: Color(0xFF21B7CA),
        foregroundColor: Colors.white,
        icon: Icons.delete,
        label: 'Delete',
      ),

    ],
  ),

    // The end action pane is the one at the right or the bottom side.
    endActionPane:  ActionPane(
      motion: ScrollMotion(),
      children: [
        SlidableAction(
          onPressed:(BuildContext context){
           // new_view.apiUpdatePost(post);
          },
          backgroundColor: Colors.tealAccent,
          foregroundColor: Colors.red,
          icon: Icons.update,
          label: 'UPDATE',

        ),
      ],
    ),
  );
}