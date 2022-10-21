import 'package:equatable/equatable.dart';

import '../model/contacts.dart';


abstract class ListPostState extends Equatable{
  @override
    List<Object> get props => [];
}
class ListPostInit extends ListPostState{}

class ListPostLoading extends ListPostState{}

class ListPostLoaded extends ListPostState{
   List <Contacts> contacts = [];
   bool isDeleted= false;
  ListPostLoaded({   required this.contacts,  required this.isDeleted});
}
class ListPostError extends ListPostState{
  final error;
  ListPostError({this.error});
}