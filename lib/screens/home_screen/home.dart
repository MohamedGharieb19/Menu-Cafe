import 'package:coffee_shop/product.dart';
import 'package:coffee_shop/screens/order_page/order_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'components/product_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffaf4ee),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xfffaf4ee),
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/images/menu.svg'),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: (){},
            color: Colors.brown,
          ),
          SizedBox(
            width: 15.0,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView(
          children: [
            Container(
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'sen',
                    fontSize: 36,
                  ),
                  children: [
                    TextSpan(text: 'It\'s Great'),
                    TextSpan(
                      text: ' Day for Coffee',
                      style: TextStyle(
                          fontFamily: 'sen',
                          fontWeight: FontWeight.bold,
                          color: Color(0xffcf9775)),
                    ),
                  ],
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: products.length,
              itemBuilder: (context, index) => ProductList(
                product: products[index],
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderPage(
                        product: products[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedItem,
        onTap: (index) {
          setState(() {
            selectedItem = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined,
                color: Color(0xffcf9775),),
              label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined,
                color: Color(0xffcf9775),),
              label: 'Location'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.coffee,
                color: Color(0xffcf9775),),
              label: 'Order'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined,
                color: Color(0xffcf9775),),
              label: 'Account'
          ),


        ],
      ),
    );
  }
}
