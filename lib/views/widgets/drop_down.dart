import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recet_iav2/consent/colors.dart';
import 'package:recet_iav2/models/models_model.dart';
import 'package:recet_iav2/providers/models_provider.dart';
// import 'package:recet_iav2/providerrs/models_provider.dart';
import 'package:recet_iav2/services/api_services.dart';
import 'package:recet_iav2/views/widgets/text_widget.dart';

import '../../constants/constants.dart';

class ModelsDropDownWidget extends StatefulWidget {
  const ModelsDropDownWidget({Key key}) : super(key: key);

  @override
  State<ModelsDropDownWidget> createState() => _ModelsDropDownWidgetState();
}

class _ModelsDropDownWidgetState extends State<ModelsDropDownWidget> {
  String currentModel = "text-davinci-003";

  @override
  Widget build(BuildContext context) {
    final modelsProvider = Provider.of<ModelsProvider>(context, listen: false);
    currentModel = modelsProvider.getCurrentModel;

    return FutureBuilder<List<ModelsModel>>(
      future: modelsProvider.getAllModels(), 
      builder: (context, AsyncSnapshot<List<ModelsModel>> snapshot) {
        if (snapshot.hasError) {
          return Center(child: TextWidget(label: snapshot.error.toString()));
        }

        if (snapshot.hasData && snapshot.data.isNotEmpty) {
          List<DropdownMenuItem<String>> dropdownItems = List<DropdownMenuItem<String>>.generate(
            snapshot.data.length,
            (index) {
              return DropdownMenuItem(
                value: snapshot.data[index].id,
                child: TextWidget(
                  label: snapshot.data[index].id,
                  fontSize: 15,
                ),
              );
            },
          );

          return FittedBox(
            child: DropdownButton<String>(
              dropdownColor: scaffoldBackgroundColor,
              iconEnabledColor: maincolor,
              items: dropdownItems,
              value: currentModel,
              onChanged: (value) {
                setState(() {
                  currentModel = value;
                });
                modelsProvider.setCurrentModel(value);
              },
            ),
          );
        } else {
          // Manejar el caso cuando no hay datos o están vacíos
          return const SizedBox.shrink();
        }
      },
    );
  }
}
