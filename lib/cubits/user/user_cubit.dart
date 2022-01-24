import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/cubits/messager/messager_cubit.dart';
import 'package:untitled/cubits/user/user_state.dart';
import 'package:untitled/models/message/message.dart';
import 'package:untitled/services/user_service.dart';
import 'package:untitled/utils/di_utils.dart';

class UserCubit extends Cubit<UserState> {
  final UserService _userService = DIUtils.get<UserService>();
  final MessagerCubit _messagerCubit = DIUtils.get<MessagerCubit>();

  UserCubit() : super(const UserState());

  void login(String username) async {
    if (username.isEmpty) {
      emit(const UserFailure('field is empty'));
      return;
    }
    try {
      emit(state.copyWith(isLoading: true));
      final List<Message> messages = await _userService.login(username);
      _messagerCubit.updateMessages(messages);
      emit(const UserSuccess(UserSuccessType.logined));
    } catch (e) {
      emit(UserFailure(e.toString()));
    }
  }
}