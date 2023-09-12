import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:recet_iav2/consent/colors.dart';
import 'package:recet_iav2/views/home.dart';


class Recipe_details extends StatelessWidget {
  //  Recipe_details({key});
  List icon = ['dough-rolling', 'cheese','meat','sausage'];
  List value = ['250g', '120g','100g','50g'];

  final String thumbnailUrl;
  final String title;
  final String rating;
  final List <dynamic> preparationSteps;

  final List <dynamic> ingredientLines;



  Recipe_details({Key key, this.thumbnailUrl,this.title,this.rating,this.ingredientLines,this.preparationSteps}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: CustomScrollView(
        slivers: [
          SliverAppBar(
            //aca está la bendita respuesta aaaaaa
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            expandedHeight: 400,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                thumbnailUrl,
                fit: BoxFit.cover,
                ), 
            ),
            bottom: PreferredSize(preferredSize:Size.fromHeight(10),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(70),
                  topRight: Radius.circular(70)
                ),
                color: Colors.white,
              ),
              child: Column(children: [
                SizedBox(height: 15),
                Container(
                  width: 80,
                  height: 4,
                  color: font,
                )
              ]),
            ),
            ),
            //AQUI VA LAS ACCIONES DE MEGUSTA Y  RETROCEDER
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CircleAvatar(
                  backgroundColor: Color.fromRGBO(250, 250, 250, 0.6),
                  radius: 18,
                  child: Icon(
                    Icons.favorite_border,
                    size: 25,
                    color: font,
                    ),
                  ),
              ),
            ],
            title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CircleAvatar(
                  backgroundColor: Color.fromRGBO(250, 250, 250, 0.6),
                  radius: 18,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(
                        
                      );
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 25,
                      color: font,
                      ),
                  ),
                  ),
              ),
          ),
          SliverToBoxAdapter(
            child: _getbody(

            ),
          )
        ],
      )),
    );
  }
  Widget _getbody(){
    return Wrap(
      children: 
        [Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                color: font,
                fontFamily: 'ro',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),

            // Text(
            //   title,style: TextStyle(
            //         fontSize: 20,
            //         color: font,
            //         fontFamily: 'ro',
            //         fontWeight: FontWeight.w700,
            //       ),
            //       ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                            

              Icon(Icons.star_rate, color: Colors.yellow, size: 20),

              Text(

                rating,

                style: TextStyle(

                  fontSize: 20,

                  color: Colors.black,

                  fontFamily: 'ro',

                ),

              ),

            ],
            ),
            const SizedBox(height: 20,),
            // Text(rating),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Container(
            //       width: 33,
            //       height: 33,
            //       child: Image.asset('images/flash.png'),

            //     ),
            //     Container(
            //       width: 33,
            //       height: 33,
            //       child: Image.asset('images/meat.png'),

            //     ),
            //     Container(
            //       width: 33,
            //       height: 33,
            //       child: Image.asset('images/oil.png'),

            //     ),
            //     Container(
            //       width: 33,
            //       height: 33,
            //       child: Image.asset('images/salt.png'),

            //     ),
            //   ],
            // ),
            //ACA ESTA EL TEXTO DE CALORIAS PROTEINAS GRASAS TOTALES ETC
            // SizedBox(height: 10,),
                        Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [Text('Ingredientes: ',style: TextStyle(
                    fontSize: 20,
                    color: font,
                    fontFamily: 'ro',
                  ),
                  ),
                  ],
              ),
            ),
              
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              child: Column(
                children: 
                  ingredientLines.map((e) => Text(e['wholeLine'].toString())).toList(),
                
                ),
              
              // child: ElevatedButton(
              //   onPressed: () {
              //     log(ingredientLines[0]['wholeLine'].toString());
              //   },

              // // textAlign: TextAlign.justify,
              // // style: TextStyle(
              // //             fontSize: 15,
              // //             color: font,
              // //             fontFamily: 'ro',
              // //             fontWeight: FontWeight.w500
              // //           ),
              // ),
            ),
          
            // SizedBox(
            //   height: 20,
            // ),

            SizedBox(height: 10,),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: [
            //       ...List.generate(
            //     4,
            //     (index) => Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 7),
            //       child: Container(
            //       width: 90,
            //       height: 40,
            //       decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(15),
            //         boxShadow: [
            //           BoxShadow(
            //             offset: Offset(1,1),
            //             color: Colors.grey,
            //             blurRadius: 7,
            
            //           )
            //         ]
            //       ),
            //       child: Padding(
            //         padding: const EdgeInsets.all(6.0),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //           Image.network('https://github.com/alireza4585/recipe-app/blob/master/images/cheese.png?raw=true'),
            //           Text(
            //             value[index],
            //             style: TextStyle(
            //             fontSize: 15,
            //             color: font,
            //             fontFamily: 'ro',
            //           ),
            //             )
            //         ],
            //         ),
            //       ),
            //   ),
            //     ),
            //     )
            //     ],
            //   ),
            // ),
            
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Text('Preparación:',
                  style: TextStyle(
                                fontSize: 20,
                                color: font,
                                fontFamily: 'ro',
                                fontWeight: FontWeight.w500,
                              ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              
              child: Column(
                children: 
                  preparationSteps.map((e) => Text(e.toString())).toList(),
                
                ),
            ),
            
          ]
          ),
        ),
      ],
    );
  }
}