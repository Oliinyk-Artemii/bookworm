import 'package:meta/meta.dart';
import 'package:untitled/models/message/message.dart';

@immutable
class MessagerState {
  final bool isLoading;
  final List<Message> messages;
  final Message? lastMessage;

  const MessagerState({
    this.isLoading = false,
    this.messages = const [],
    this.lastMessage,
  });

  MessagerState copyWith({
    bool? isLoading,
    List<Message>? messages,
    Message? lastMessage,
  }) {
    return MessagerState(
      isLoading: isLoading ?? this.isLoading,
      messages: messages ?? this.messages,
      lastMessage: lastMessage ?? this.lastMessage,
    );
  }
}

class MessagerSuccess extends MessagerState {
  final MessagerSuccessType type;

  const MessagerSuccess(
    this.type, {
    required List<Message> messages,
  }) : super(messages: messages);
}

enum MessagerSuccessType { messageSent }

class MessagerFailure extends MessagerState {
  final String error;

  const MessagerFailure(this.error);
}
