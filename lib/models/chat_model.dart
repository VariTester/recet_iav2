class ChatModel {
   final String msg;
   final int chatIndex;

  ChatModel({this.msg,this.chatIndex});
   factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
    msg: json["msg"],
    chatIndex: json["chatIndex"],
    
  );
}