import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/cubits/messager/messager_state.dart';

class MessagerCubit extends Cubit<MessagerState> {
  // final CompaniesService _companiesService = DIUtils.get<CompaniesService>();

  MessagerCubit() : super(const MessagerState());

  void login(String username) async {
    if (username.isEmpty) {
      emit(const MessagerFailure('field is empty'));
      return;
    }
    try {
      emit(state.copyWith(isLoading: true));
      // await _companiesService.addCompany(name);
      emit(const MessagerSuccess(MessagerSuccessType.messageSent));
    } catch (e) {
      emit(MessagerFailure(e.toString()));
    }
  }
}