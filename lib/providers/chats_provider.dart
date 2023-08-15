import 'package:flutter/cupertino.dart';
import 'package:recet_iav2/models/chat_model.dart';

import '../services/api_services.dart';

class ChatProvider with ChangeNotifier{
  List<ChatModel> chatList = [];
  List<ChatModel> get getChatList{
    return chatList;
  }

  void addUserMessage ({ String msg}){
    chatList.add(ChatModel(msg: msg, chatIndex: 0));
    notifyListeners();
  }

  Future <void> sendMessageAndGetAnswers({String msg, String choosenModelId})async{
    chatList.addAll(
        await ApiService.sendMessage(
        message: msg,
        modelId: choosenModelId,
      ));
      notifyListeners();
  }

}