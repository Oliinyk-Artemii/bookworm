import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/utils/values/gen/assets.gen.dart';
import 'package:untitled/utils/values/gen/fonts.gen.dart';

class ChipsPage extends StatefulWidget {
  const ChipsPage({Key? key}) : super(key: key);

  @override
  _ChipsPageState createState() => _ChipsPageState();
}

class _ChipsPageState extends State<ChipsPage> {
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
        child: SafeArea(
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
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
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
                              shape: BoxShape.circle, color: Color(0xFF8BE11C)),
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
            body: Column(
              children: [
                SizedBox(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    reverse: true,
                    child: Column(
                      children: [
                        SizedBox(height: AppBar().preferredSize.height),
                      ],
                    ),
                  ),
                ),
                getChip("ewrfgjihr", true),
                getChip("ewrfgjihr", false),
                getChip("ewrfgjihr", true),
                getChip("ewrfgjihr", false),
                getChip("ewrfgjihr", true),
              ],
            ),
          ),
        ),
      ),
    );

  }
  Widget getChip(String name, bool isSelected){
    return Container(
      width: 160,
      height: 32,
      margin: EdgeInsets.only(left: 36, top: 453.2),
      decoration: BoxDecoration(
        color:  isSelected ?  Color(0xFF794E72) : Color(0xFFB57B94),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width / 1.5,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(name,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
