import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recet_iav2/consent/colors.dart';
import 'package:recet_iav2/constants/constants.dart';
import 'package:recet_iav2/services/assets_manager.dart';
import 'package:recet_iav2/views/widgets/text_widget.dart';

class ChhatWidget extends StatelessWidget {
  const ChhatWidget({Key key, this.msg, this.chatIndex, }) : super(key: key);

  final String msg;
  final int chatIndex;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Material(
        color: chatIndex == 0 ? scaffoldBackgroundColor: Colors.white,
        // color: Color.fromARGB(141, 233, 233, 233),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                chatIndex == 0
                  ? AssetsManager.userImage
                  : AssetsManager.botImage,
                height: 30,
                 width: 30,
                ),
                //aqui va el espaciado entre el personaje y el texto
                const SizedBox(
                  width: 8,
                ),
                 Expanded(
                  child: chatIndex == 0
                    ?TextWidget(
                      label: msg,
                    ) 
                    :DefaultTextStyle(
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                      child: AnimatedTextKit(
                        isRepeatingAnimation: false,
                        repeatForever: false,
                        displayFullTextOnTap: true,
                        totalRepeatCount: 1,
                        animatedTexts: [
                          TyperAnimatedText(
                            msg.trim(),
                            ),
                            ],
                            ),
                    ),
                  // child: TextWidget(label: msg,),
                 ),
                 chatIndex == 0
                 ? SizedBox.shrink(
                 ): Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(FontAwesomeIcons.thumbsUp,
                    color: Colors.black,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(FontAwesomeIcons.thumbsDown,
                    color: Colors.black,
                    ),
                  ],
                 )
                ],
                ),
        ),
      ),
    ],);
  }
}