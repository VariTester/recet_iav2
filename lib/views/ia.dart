import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recet_iav2/consent/colors.dart';
import 'package:recet_iav2/constants/constants.dart';
import 'package:recet_iav2/main.dart';
import 'package:recet_iav2/services/assets_manager.dart';
import 'package:recet_iav2/views/widgets/chat_widget.dart';
class Ia extends StatefulWidget {
  const Ia({Key key}) : super(key: key);

  @override
  State<Ia> createState() => _IaState();
}

class _IaState extends State<Ia> {

  final bool _isTyping = true;

   TextEditingController textEditingController;
  @override
  void initState() {
    // TODO: implement initState
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: maincolor,
        leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(AssetsManager.openaiLogo,height: 50,),
      ),
      title: const Text(
                  'recetIA chat box',style: TextStyle(
                  fontSize: 20,
                  //color del titulo
                  color: Colors.white,
                  fontFamily: 'ro',
                ),
                ),
                actions: [
                  IconButton(onPressed: (){},
                   icon: Icon(Icons.more_vert_rounded))
                ],
      ),
       body: SafeArea(
         child: Column(
          children: [
          Flexible(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder:(context, index) {
                return  ChhatWidget(
                  msg: chatMessages[index]["msg"],
                  chatIndex: chatMessages[index]["chatIndex"],
                );
              },),
          ),
          if(_isTyping) ...[
             SpinKitThreeBounce(
              //para controlar ell color del cargador
              color: maincolor,
              size: 20,
              ),
              const SizedBox(height: 15,),
              Material(
                //el color del rectangulo para escribir
                color: Color.fromARGB(163, 138, 184, 126),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          style: const TextStyle(
                            //color de la letra cuando escribes
                            color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          controller: textEditingController,
                          onSubmitted: (value){
                          //Todo send message
                        },
                        decoration: const InputDecoration.collapsed(
                          hintText: "Hola! Cómo puedo ayudarte?",
                          hintStyle: TextStyle(
                            //color de la letra en espera
                            color: Color.fromARGB(255, 8, 8, 8), 
                            ),
                            ),
                        ),
                      ),
                      IconButton(onPressed: (){}, icon: const Icon(FontAwesomeIcons.paperPlane,))
                    ],
                  ),
                ),
              )
          ]
         ],
         ),
       )
    );
  }
}