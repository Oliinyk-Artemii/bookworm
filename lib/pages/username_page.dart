import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/cubits/user/user_cubit.dart';
import 'package:untitled/cubits/user/user_state.dart';
import 'package:untitled/project_router.dart';
import 'package:untitled/utils/di_utils.dart';
import 'package:untitled/utils/values/gen/assets.gen.dart';
import 'package:untitled/utils/values/gen/fonts.gen.dart';

class UsernamePage extends StatefulWidget {
  const UsernamePage({Key? key}) : super(key: key);

  @override
  _UsernamePageState createState() => _UsernamePageState();
}

class _UsernamePageState extends State<UsernamePage> {
  final TextEditingController usernameController = TextEditingController();
  late UserCubit userCubit;

  @override
  void initState() {
    super.initState();
    userCubit = DIUtils.get<UserCubit>();
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
        child: BlocListener<UserCubit, UserState>(
            listener: (BuildContext context, UserState state) {
              if (state is UserFailure) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.error),
                ));
              } else if (state is UserSuccess && state.type == UserSuccessType.logined) {
                Navigator.pushNamed(context, Routes.dialog.name);
              }
            },
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                resizeToAvoidBottomInset: true,
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: Container(),
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
                                  shape: BoxShape.circle, color: Colors.red),
                            ),
                          ),
                          const Text(
                            "Offline",
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
                body: Align(
                  alignment: Alignment.bottomCenter,
                  child: getTextField(),
                ),
              ),
            ),
        ),
      ),
    );
  }

  Widget getTextField() {
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: TextField(
                  cursorColor: Colors.black,
                  controller: usernameController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Write your nickname...",
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                userCubit.login(usernameController.text);
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
