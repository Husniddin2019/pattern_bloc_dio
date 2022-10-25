import 'package:equatable/equatable.dart';

abstract class CreatePostState extends Equatable{
  @override
  List<Object> get props => [];
}

class CreatePostInit extends CreatePostState{}
class CreatePostLoading extends CreatePostState{}
class CreatePostLoaded extends CreatePostState{
   bool isCreated = false;
  CreatePostLoaded({ required this.isCreated});
}
class CreatePostError extends CreatePostState{
  final error;
  CreatePostError({this.error});
}