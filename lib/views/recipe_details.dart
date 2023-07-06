import 'package:flutter/material.dart';
import 'package:recet_iav2/consent/colors.dart';
import 'package:recet_iav2/views/home.dart';

class Recipe_details extends StatelessWidget {
  // const Recipe_details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'images/p3.jpg',
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
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                          return HomePage();
                        },
                        ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 33,
                  height: 33,
                  child: Image.asset('images/flash.png'),

                ),
                Container(
                  width: 33,
                  height: 33,
                  child: Image.asset('images/meat.png'),

                ),
                Container(
                  width: 33,
                  height: 33,
                  child: Image.asset('images/oil.png'),

                ),
                Container(
                  width: 33,
                  height: 33,
                  child: Image.asset('images/salt.png'),

                ),
              ],
            ),
            //ACA ESTA EL TEXTO DE CALORIAS PROTEINAS GRASAS TOTALES ETC
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('120',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontFamily: 'ro',
                ),
                ),
                Text('150',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontFamily: 'ro',
                ),
                ),
                Text('20',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontFamily: 'ro',
                ),
                ),
                Text('30',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontFamily: 'ro',
                ),
                ),
              ],
            ),
            SizedBox(

            )
          ]),
        ),
      ],
    );
  }
}