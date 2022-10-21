import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc/model/contacts.dart';
import 'package:pattern_bloc/service/http.dart';

import 'list_post_state.dart';

class ListPostCubit extends Cubit <ListPostState>{
  ListPostCubit(): super(ListPostInit());

  void apiPostList()async{
    emit(ListPostLoading());
    final response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    print(response);
    if(response!=null){
      emit(ListPostLoaded(contacts: Network.parsePostList(response), isDeleted: false));
    }
    else{
      emit(ListPostError(error: "Couldn't fetch posts"));
    }



  }

 void  apiPostDelete(Contacts contacts) async {
   emit(ListPostLoading());
    final response = await Network.DEL(Network.API_DELETE + contacts.id.toString(), Network.paramsEmpty());
    print(response);
if (response!=null){
  apiPostList();
}else{
  emit(ListPostError(error: "Osirilmadi"));
}

  }

}