import 'package:flutter/material.dart';

import '../views/widgets/drop_down.dart';
import '../views/widgets/text_widget.dart';

class Services{
  static Future<void> showModalSheet({ BuildContext context})async{
  await showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
          )
            ),
              context: context,
              builder: (context){
                return Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                          //"Texto para cambiar las opciondes de los 3 puntos"
                      Flexible(child: TextWidget(
                        label: "Chosen Model:",
                        fontSize: 16,
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: ModelsDropDownWidget()) 
                        ],
                      ),
                    );
                   },
                   );
  }
}