import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc/block/update_post_state.dart';
import 'package:pattern_bloc/model/contacts.dart';

import '../service/http.dart';

class UpdatePostCubit extends Cubit<UpdatePostState>  {
  UpdatePostCubit() : super(UpdatePostInit());


  void apiPostUpdate(Contacts post) async{

    print(post.toJson());
    emit(UpdatePostLoading());
    final response = await Network.PUT(Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post));
    print(response);
    if (response != null) {
      emit(UpdatePostLoaded(isUpdated: true));
    } else {
      emit(UpdatePostError(error: "Couldn't update post"));
    }
  }
}