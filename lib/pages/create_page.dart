import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pattern_bloc/block/create_post_cubit.dart';
import 'package:pattern_bloc/block/create_post_state.dart';
import 'package:pattern_bloc/pages/home.dart';
import 'package:pattern_bloc/view/view_of_create.dart';
class CreatePsge extends StatefulWidget {
  const CreatePsge({Key? key}) : super(key: key);

  @override
  State<CreatePsge> createState() => _CreatePsgeState();
}

class _CreatePsgeState extends State<CreatePsge> {
  _finish (BuildContext context){
    Navigator.of(context).pop(context);
  }

  bool isLoading = false;
  TextEditingController _title = TextEditingController();
  TextEditingController _body = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> CreatePostCubit(),
      child: Scaffold(
      appBar: AppBar(
        title: Text("ADD"),
      ),
      body: BlocBuilder<CreatePostCubit, CreatePostState>(
        builder: (BuildContext context, CreatePostState state){
          if (state is CreatePostLoading){
            return viewOfCreate(true, context, _title, _body);
          }
          if (state is CreatePostLoaded){ _finish(context);}

          if (state is CreatePostError){        }

          return  viewOfCreate(false, context, _title, _body);
        },
      ),

    ),);

  }
}
