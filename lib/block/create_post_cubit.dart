import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc/block/create_post_state.dart';
import 'package:pattern_bloc/model/contacts.dart';
import 'package:pattern_bloc/service/http.dart';

class CreatePostCubit extends Cubit<CreatePostState>{
  CreatePostCubit(): super (CreatePostInit());

  void apiPostCreate(Contacts contacts) async{
    print(contacts.toJson());
    emit(CreatePostLoading());
    final response = await Network.POST(Network.API_CREATE,Network.paramsCreate(contacts) );
    print(response);
    if (response!= null){
      emit(CreatePostLoaded(isCreated: true));
    }else
      {emit(CreatePostError(error: "Coldn't create post"));
      }
  }
}