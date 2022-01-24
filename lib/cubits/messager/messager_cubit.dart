import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/cubits/messager/messager_state.dart';
import 'package:untitled/models/message/message.dart';

class MessagerCubit extends Cubit<MessagerState> {
  // final CompaniesService _companiesService = DIUtils.get<CompaniesService>();

  MessagerCubit() : super(const MessagerState());

  void login(String message) async {
    if (message.isEmpty) {
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

  void updateMessages(List<Message> messages) {
    emit(state.copyWith(messages: messages));
  }
}