import 'package:flutter/foundation.dart';
import 'package:recet_iav2/models/models_model.dart';
import 'package:recet_iav2/services/api_services.dart';

class ModelsProvider with ChangeNotifier{

  String currentModel = "text-davinci-003";

  String get getCurrentModel{
    return currentModel;
  }

  void setCurrentModel (String newModel){
    currentModel = newModel;
    notifyListeners();

  }

  List <ModelsModel> modelsList = [];
  

  List <ModelsModel> get getModelsList{
    return modelsList;
  }

  Future <List<ModelsModel>> getAllModels () async{
    modelsList = await ApiService.getModels();
    return modelsList;
  }

}