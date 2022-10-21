import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pattern_bloc/block/list_post_cubic.dart';
import 'package:pattern_bloc/block/list_post_state.dart';
import 'package:pattern_bloc/view/view_of_home.dart';


import '../model/contacts.dart';




class home1 extends StatefulWidget {
  const home1({Key? key}) : super(key: key);
  @override
  State<home1> createState() => _homeState();
}

class _homeState extends State<home1> {
  List<Contacts> items =[];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ListPostCubit>(context).apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc"),
      ),
      body: BlocBuilder<ListPostCubit, ListPostState>(
        builder: (BuildContext context, ListPostState state){
          if (state is ListPostError){
            return viewOfHome(items, true);
          }
          if (state is ListPostLoaded){
            items=state.contacts;
            return viewOfHome(items, false);
                      }
          return   viewOfHome(items, true);
        },
      ),



      floatingActionButton:  FloatingActionButton
        (onPressed: (){ },child: Icon(Icons.add), ),
    );
  }

}
