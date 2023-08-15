import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:recet_iav2/constants/api_consts.dart';
import 'package:recet_iav2/models/chat_model.dart';
import 'package:recet_iav2/models/models_model.dart';
class ApiService{
  static Future<List<ModelsModel>> getModels()async {
    try{
      var response = await http.get(
        //bendito error de quitarle la interpolacion y ponerlo en camellcase
        Uri.parse("$baseUrl/models"),
        headers: {
        'Authorization':'Bearer $apiKey'},
      );

      Map jsonResponse = jsonDecode(response.body);
      if(jsonResponse['error'] != null){
        throw HttpException(jsonResponse['error']["message"]);
      }
      // print("jsonResponse $jsonResponse");
      List temp = [];
      for (var value in jsonResponse["data"]){
        temp.add(value);
        log("temp $value");
      }
      return ModelsModel.modelsFromSnapshoot(temp);
    }catch(error){
      log("error $error");
      rethrow;
    }
  }

  //send Message fct
    static Future<List<ChatModel>> sendMessage({ String message,  String modelId})async {
    try{
      log("modelId $modelId");
      var response = await http.post(
        //bendito error de quitarle la interpolacion y ponerlo en camellcase
        Uri.parse("$baseUrl/completions"),
        headers: {
        'Authorization':'Bearer $apiKey',
        'Content-Type':'application/json'
        },
        body: jsonEncode({
          //aqui esta el error pero debo leer la documentacion
          "model":modelId,
          "prompt": message,
          // "prompt":[
          //   {
          //     "role":"user",
          //     "content":message,
          //   }
          // ],
          "max_tokens":300,
          }
          ),
      );

      Map jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));

      if(jsonResponse['error'] != null){
        throw HttpException(jsonResponse['error']["message"]);
      }

      List<ChatModel>chatList=[];

      if(jsonResponse["choices"].length >0){
        // log("jsonResponse[choises]text ${jsonResponse["choices"][0]["text"]}");
        chatList = List.generate(
          jsonResponse["choices"].length,
          (index) => ChatModel(
            msg: jsonResponse["choices"][index]["text"],
            chatIndex: 1,
            ),
            );
      }
      return chatList;
    }catch(error){
      log("error $error");
      rethrow;
    }
  }
} 