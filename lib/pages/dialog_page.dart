import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/cubits/messager/messager_cubit.dart';
import 'package:untitled/cubits/messager/messager_state.dart';
import 'package:untitled/cubits/user/user_cubit.dart';
import 'package:untitled/cubits/user/user_state.dart';
import 'package:untitled/utils/di_utils.dart';
import 'package:untitled/utils/values/gen/assets.gen.dart';
import 'package:untitled/utils/values/gen/fonts.gen.dart';
import 'package:untitled/project_router.dart';

class DialogPage extends StatefulWidget {
  const DialogPage({Key? key}) : super(key: key);

  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  TextEditingController _sendMessageController = TextEditingController();
  late UserCubit userCubit;
  late MessagerCubit messagerCubit;

  @override
  void initState() {
    super.initState();
    userCubit = DIUtils.get<UserCubit>();
    messagerCubit = DIUtils.get<MessagerCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0,
              0.35,
              0.64,
              0.82,
              1,
            ],
            colors: [
              Color(0x99F51C6D),
              Color(0x99DB739B),
              Color(0x99A8B3B8),
              Color(0x9991DACB),
              Color(0x998BF1D4),
            ],
          ),
        ),
        child: BlocConsumer<MessagerCubit, MessagerState>(
          listener: (context, MessagerState state) {
            if (state is MessagerSuccess && state.type == MessagerSuccessType.messageSent) {
              _sendMessageController.text = '';
            } else if (state is MessagerFailure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error),
              ));
            }
          },
            builder: (context, MessagerState state) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              resizeToAvoidBottomInset: true,
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Assets.images.icons.close.svg(),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(bottom: 2.0),
                      child: Text(
                        "BOOKWORM",
                        style: TextStyle(
                          letterSpacing: 2,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontFamily: FontFamily.montserrat,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 6.0),
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF8BE11C)),
                          ),
                        ),
                        const Text(
                          "Online",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontFamily: FontFamily.montserrat,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Assets.images.icons.bot.svg(),
                  ),
                ],
              ),
              body: Stack(
                children: [
                  SizedBox(
                    height: double.infinity,
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      reverse: true,
                      child: Column(
                        children: [
                          SizedBox(height: AppBar().preferredSize.height),
                          ...state.messages.map((message) => getMessage(
                                message.message,
                                isRightMessage:
                                    message.user == userCubit.state.username,
                              )),
                          Container(),
                          const SizedBox(
                            height: 50,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: getBottom(),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget getMessage(String message, {required bool isRightMessage}) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
      child: Row(
        mainAxisAlignment:
            isRightMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: isRightMessage ? Color(0xFFB57B94) : Color(0xFF794E72),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width / 1.5,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  message,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getBottom() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFE3FDF8),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.chips.name);
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  Icons.add,
                  size: 35,
                  color: Color(0x99e22678),
                ),
              ),
            ),
            Expanded(
              child: TextField(
                cursorColor: Colors.black,
                controller: _sendMessageController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Write a message...",
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                messagerCubit.sendMessage(_sendMessageController.text,
                    userCubit.state.username ?? '');
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Assets.images.icons.send.svg(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
