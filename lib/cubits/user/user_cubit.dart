import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/cubits/user/user_state.dart';

class UserCubit extends Cubit<UserState> {
  // final CompaniesService _companiesService = DIUtils.get<CompaniesService>();

  UserCubit() : super(const UserState());

  void login(String username) async {
    if (username.isEmpty) {
      emit(const UserFailure('field is empty'));
      return;
    }
    try {
      emit(state.copyWith(isLoading: true));
      // await _companiesService.addCompany(name);
      emit(const UserSuccess(UserSuccessType.logined));
    } catch (e) {
      emit(UserFailure(e.toString()));
    }
  }
}