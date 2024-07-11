import 'package:experimental_app/config/app_routes.dart';
import 'package:flutter/material.dart';

// Creacion del cuerpo de la aplicacion

// Seccion parte superior
class HomePageBodyTop extends StatelessWidget {
  const HomePageBodyTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      transform: Matrix4.translationValues(0, -12, 0),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 2, 111, 253),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15)
        ),
      ),
      height: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40),
            child: const Text('Your Budget', style: TextStyle(color: Colors.white),),
          ),
          const CustomMoneyDisplay(
            account: 2868000.12, 
            padding: EdgeInsets.only(top: 5, left: 5), 
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontWeight: FontWeight.w600
            )),
          SummaryCard(
            typeIcon: TypeIconCard.incomes,
            account: '700,000', 
            period: 'Jun 9 - Nov 10', 
            action: () {}
          ),
          SummaryCard(
            typeIcon: TypeIconCard.spending, 
            account: '90,000', 
            period: 'May 14 - Jun 25', 
            action: () {}
          )
        ],
      ),
    );
  }
}

class CustomMoneyDisplay extends StatelessWidget {
  final double account;
  final EdgeInsets padding;
  final TextStyle style;
  
  const CustomMoneyDisplay({
    super.key, 
    required this.account, 
    required this.padding,
    required this.style
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Text(account.toString() , style: style,),
    );
  }
}

enum TypeIconCard { spending, incomes }

class SummaryCard extends StatelessWidget {
  final TypeIconCard typeIcon;
  final String account;
  final String period;
  final VoidCallback action;
  
  const SummaryCard({
    super.key,
    required this.typeIcon,
    required this.account,
    required this.period,
    required this.action
  });

  @override
  Widget build(BuildContext context) {
    
  var iconUp = const Icon(
    Icons.arrow_upward,
    color: Colors.greenAccent,
  );

  var iconDown = const Icon(
    Icons.arrow_downward,
    color: Colors.redAccent,
  );
    
    return Container(
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF5D80FA),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 249, 249, 250),
              border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10)
            ),
            child: typeIcon == TypeIconCard.incomes ? 
               iconUp : iconDown,
          ),
          Expanded(
            child: Text(typeIcon == TypeIconCard.incomes 
               ? 'Incomes' : 'Spending', style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
               ),),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(account, style: const TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.w500
              ),),
              Text(period, style: const TextStyle(
                color: Colors.white,
                fontSize: 10
              ),)
            ],
          ),
          Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(10)
            ),
            child: IconButton(
              icon: const Icon(Icons.chevron_right),
              onPressed: action,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}


class HomePageBodyMid extends StatelessWidget {
  final ButtonStyle categoriesBtnStyle;
  final ButtonStyle recentTransactionBtnStyle;
  final VoidCallback? categoriesBtnAction;
  final VoidCallback? recentTransactionBtnAction;
  
  const HomePageBodyMid({
    super.key,
    required this.categoriesBtnStyle,
    required this.recentTransactionBtnStyle,
    required this.categoriesBtnAction,
    required this.recentTransactionBtnAction
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: categoriesBtnStyle,
            onPressed: categoriesBtnAction, 
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Text(
                'Categories',
                style: TextStyle(color: Color.fromARGB(240, 0, 0, 0), fontSize: 14),
              ),
            )
          ),
          ElevatedButton(
            style: recentTransactionBtnStyle,
            onPressed: recentTransactionBtnAction, 
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Text(
                'Recent Transactions',
                style: TextStyle(color: Color.fromARGB(240, 0, 0, 0), fontSize: 14),
              ),
            ))
        ],
      ),
    );
  }
}


class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextButton(
          style: const ButtonStyle(
            alignment: Alignment.centerRight
          ),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(AppRoutes.newPage);
          }, 
          child: const Text(
            'View All',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w400),
          )),
          const ProductDetailCard(
            pathToImage: 'assets/images/cat_decoration.png', 
            account: 391.254, 
            productName: 'Cat Decoration', 
            currentSells: '+ 2791 Sells', 
            percentage: 15, 
            typeProductDetailCard: TypeProductDetail.incomes
          ),
          const ProductDetailCard(
            pathToImage: 'assets/images/angry_cat.png', 
            account: 3176.254, 
            productName: 'Angry Cat', 
            currentSells: '+ 4356 Sells', 
            percentage: 47, 
            typeProductDetailCard: TypeProductDetail.incomes
          ),
          const ProductDetailCard(
            pathToImage: 'assets/images/black_cat.png', 
            account: 100345.254, 
            productName: 'Black Cat', 
            currentSells: '+ 3455 Sells', 
            percentage: 45, 
            typeProductDetailCard: TypeProductDetail.spending
          ),

          const ProductDetailCard(
            pathToImage: 'assets/images/cat_girl.png', 
            account: 43565.45, 
            productName: 'Cat Girl UWU', 
            currentSells: '+ 200 Sells', 
            percentage: 2, 
            typeProductDetailCard: TypeProductDetail.incomes
          ),
          const ProductDetailCard(
            pathToImage: 'assets/images/cat_weird.png', 
            account: 22435.567, 
            productName: 'Weird Cat', 
            currentSells: '+ 568,566 Sells', 
            percentage: 24, 
            typeProductDetailCard: TypeProductDetail.incomes
          ),
          const ProductDetailCard(
            pathToImage: 'assets/images/samuel_cat.png', 
            account: 0.95566, 
            productName: 'Samuel Cat', 
            currentSells: '+ 56,455 Sells', 
            percentage: 78, 
            typeProductDetailCard: TypeProductDetail.spending
          ),
          const ProductDetailCard(
            pathToImage: 'assets/images/smart_cat.png', 
            account: 7076.67, 
            productName: 'Smart Cat', 
            currentSells: '+ 65787,678 Sells', 
            percentage: 34, 
            typeProductDetailCard: TypeProductDetail.incomes
          ),
      ],
    );
  }
}

class ProductDetailCard extends StatelessWidget {
  final String pathToImage;
  final double account;
  final String productName;
  final String currentSells;
  final double percentage;
  final TypeProductDetail typeProductDetailCard; 
  
  const ProductDetailCard({
    super.key,
    required this.pathToImage,
    required this.account,
    required this.productName,
    required this.currentSells,
    required this.percentage,
    required this.typeProductDetailCard
  });

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: 
        Row( 
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.only(right: 15),
              width: 40,
              height: 60,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 216, 215, 215),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(pathToImage), scale: 1.0
                )
              ),
            ),
            Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(productName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                  Text(currentSells, style: const TextStyle(
                    color: Color.fromARGB(235, 207, 207, 206),
                    fontSize: 10,
                    fontWeight: FontWeight.w500
                  ),),
                  Text(account.toString(), style: const TextStyle(
                    color: Color.fromARGB(255, 17, 144, 248),
                    fontSize: 26,
                    fontWeight: FontWeight.w800
                  ),)
                ],
              ),
            ),
                      Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: typeProductDetailCard == TypeProductDetail.incomes ? 
                          const Color.fromARGB(230, 81, 240, 86) : Colors.red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                            height: 10,
                            child: Icon(typeProductDetailCard == TypeProductDetail.incomes ? 
                               Icons.arrow_upward : Icons.arrow_downward, 
                               size: 10,
                          ),),

                          Text(
                           '$percentage%',
                            style: const TextStyle(
                            color: Color.fromARGB(255, 238, 252, 237),
                            fontWeight: FontWeight.bold,
                            fontSize: 10
                            ),
                          ),
                        ],
                      )
                     ),
              ]
          ),
    );
  }
}

enum TypeProductDetail { incomes, spending }