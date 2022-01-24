import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/cubits/messager/messager_state.dart';
import 'package:untitled/models/message/message.dart';
import 'package:untitled/services/messager_service.dart';
import 'package:untitled/utils/di_utils.dart';

class MessagerCubit extends Cubit<MessagerState> {
  final MessagerService _companiesService = DIUtils.get<MessagerService>();

  MessagerCubit() : super(const MessagerState());

  void sendMessage(String message, String username) async {
    if (message.isEmpty) {
      emit(const MessagerFailure('field is empty'));
      return;
    }
    try {
      emit(state.copyWith(isLoading: true));
      final List<Message> messages = await _companiesService.sendMessage(Message(
        message: message,
        user: username,
      ));
      emit(MessagerSuccess(MessagerSuccessType.messageSent, messages: messages));
    } catch (e) {
      emit(MessagerFailure(e.toString()));
    }
  }

  void updateMessages(List<Message> messages) {
    emit(state.copyWith(messages: messages));
  }
}
