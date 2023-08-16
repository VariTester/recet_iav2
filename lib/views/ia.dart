import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:recet_iav2/consent/colors.dart';
import 'package:recet_iav2/constants/constants.dart';
import 'package:recet_iav2/main.dart';
import 'package:recet_iav2/models/chat_model.dart';
import 'package:recet_iav2/providers/chats_provider.dart';
import 'package:recet_iav2/services/api_services.dart';
import 'package:recet_iav2/services/assets_manager.dart';
import 'package:recet_iav2/views/widgets/chat_widget.dart';
import 'package:recet_iav2/views/widgets/text_widget.dart';

import '../providers/models_provider.dart';
import '../services/services.dart';
class Ia extends StatefulWidget {
  const Ia({Key key}) : super(key: key);

  @override
  State<Ia> createState() => _IaState();
}

class _IaState extends State<Ia> {
  // Declarar y inicializar un FocusNode
  FocusNode focusNode = FocusNode();
//aca le saque el finel al bool
   bool _isTyping = false;

  ScrollController _listScrollController;

   TextEditingController textEditingController;
  //  Late Focusnode focusnode
  @override
  void initState() {
    // TODO: implement initState
    _listScrollController = ScrollController();
    textEditingController = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _listScrollController.dispose();
    // Liberar recursos asociados al FocusNode en el dispose
    textEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }
  // List<ChatModel> chatList = [];

  @override
  Widget build(BuildContext context) {
    final modelsProvider = Provider.of<ModelsProvider>(context);
    final chatProvider = Provider.of<ChatProvider>(context);
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
                  color: Color.fromARGB(255, 233, 227, 227),
                  fontFamily: 'ro',
                ),
                ),
                actions: [
                  IconButton(
                  onPressed: ()async{
                    await Services.showModalSheet(context:context);
                  },
                   icon: Icon(Icons.more_vert_rounded))
                ],
      ),
       body: SafeArea(
         child: Column(
          children: [
          Flexible(
            child: ListView.builder(
              controller: _listScrollController,
              itemCount: chatProvider.getChatList.length, //chatList.length,
              itemBuilder:(context, index) {
                return  ChhatWidget(
                  msg: chatProvider.getChatList[index].msg,//chatList[index].msg,
                  chatIndex: chatProvider.getChatList[index].chatIndex, //chatList[index].chatIndex,
                );
              },),
          ),
          if(_isTyping) ...[
             SpinKitThreeBounce(
              //para controlar ell color del cargador
              color: maincolor,
              size: 20,
              ),],
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
                          focusNode: focusNode,
                          style: const TextStyle(
                            //color de la letra cuando escribes
                            color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          controller: textEditingController,
                          onSubmitted: (value) async{
                            await sendMessageFCT(
                              modelsProvider: modelsProvider,
                              chatProvider: chatProvider);
                        },
                        decoration: const InputDecoration.collapsed(
                          hintText: "Hola! Cómo puedo ayudarte?",
                          hintStyle: TextStyle(
                            //color de la letra en espera
                            color: Color.fromARGB(80, 8, 8, 8), 
                            ),
                            ),
                        ),
                      ),
                      IconButton(
                        onPressed: ()async {
                          await sendMessageFCT(
                            modelsProvider: modelsProvider,
                            chatProvider: chatProvider);
                        },
                      icon: const Icon(
                        FontAwesomeIcons.paperPlane,))
                    ],
                  ),
                ),
              ),
         ],
         ),
       )
    );
  }
  void scrollListToEND(){
    _listScrollController.animateTo(
      _listScrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 2),
      curve: Curves.easeOut);
  }
  Future<void> sendMessageFCT (
    {ModelsProvider modelsProvider,
    ChatProvider chatProvider}) async {
          if(_isTyping){
        ScaffoldMessenger.of(
        context).showSnackBar(
          const SnackBar(
            content: TextWidget(
              label: "Por favor no mandes múltiples mensajes al mismo tiempo",
              ),
              backgroundColor:Colors.red,
              ),
              );
      return;
    }
    if(textEditingController.text.isEmpty){
        ScaffoldMessenger.of(
        context).showSnackBar(
          const SnackBar(
            content: TextWidget(
              label: "Por favor escriba un mensaje",
              ),
              backgroundColor:Colors.red,
              ),
              );
      return;
    }
    try{
      String msg = textEditingController.text;
          // log("se ha mandado con exito la respuesta");
      setState(() {
        _isTyping=true;
        // chatList.add(ChatModel(msg: textEditingController.text,chatIndex: 0));
        chatProvider.addUserMessage(msg: msg);
        textEditingController.clear();
        focusNode.unfocus();
      });
      await chatProvider.sendMessageAndGetAnswers(
        msg: msg,
        choosenModelId: modelsProvider.getCurrentModel);
      // chatList.addAll(
      //   await ApiService.sendMessage(
      //   message: textEditingController.text,
      //   modelId: modelsProvider.getCurrentModel
      // ),
      // );
      setState(() {});
    }catch(error){
      log("error $error");
      ScaffoldMessenger.of(
        context).showSnackBar(
          SnackBar(
            content: TextWidget(
              label: error.toString(),
              ),
              backgroundColor:Colors.red,
              ),
              );
    }finally{
      setState(() {
        scrollListToEND();
      _isTyping = false;
      });
    }
  }
}