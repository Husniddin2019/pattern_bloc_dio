import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc/block/update_post_cubit.dart';
import 'package:pattern_bloc/model/contacts.dart';


Widget viewOfUpdate(bool isLoading,BuildContext context,Contacts contacts,TextEditingController _title,TextEditingController _body){

  return Container(
    padding: EdgeInsets.all(30),
    child: Stack(
      children: [
        Column(
          children: [
            Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                child: TextField(
                    controller: _title,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Colors.grey),

                        ),
                        hintText: ("Insert title"),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        )
                    )
                )
            ),
            SizedBox(height: 20,),
            Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                child: TextField(
                    controller: _body,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Colors.grey),

                        ),
                        hintText: ("Insert body"),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        )
                    )
                )
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(40))
              ),
              child: FlatButton(

                  onPressed: (){ BlocProvider.of<UpdatePostCubit>(context).apiPostUpdate(contacts);
                  },
                  child: Text("OK")),),
          ],
        ),

        isLoading? Center(child: CircularProgressIndicator(),):SizedBox.shrink(),

      ],
    ),
  );
}