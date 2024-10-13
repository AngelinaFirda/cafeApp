import 'package:flutter/material.dart';
import 'package:wikusama_cafe/models/product.dart';

class CustomerHomePage extends StatelessWidget {
  CustomerHomePage({Key? key}) : super(key: key);

  final List<Product> products = [
    Product(
      id: 1,
      name: 'Caffè latte',
      description: 'Coffee',
      price: 'Rp.25.000',
      imageUrl: 'images/coffee_latte.png',
    ),
    Product(
      id: 2,
      name: 'Cold Brew',
      description: 'Coffee',
      price: 'Rp.30.000',
      imageUrl: 'images/coffee_ice.png',
    ),
    Product(
      id: 3,
      name: 'Hot Vanilla Tea',
      description: 'Tea',
      price: 'Rp.15.000',
      imageUrl: 'images/tea_hot.png',
    ),
    Product(
      id: 4,
      name: 'Peach Iced Tea',
      description: 'Tea',
      price: 'Rp.20.000',
      imageUrl: 'images/tea_ice.png',
    ),
  ];

  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 18) {
      return 'Good Afternoon';
    } else if (hour >= 18 && hour < 21) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

  @override
  Widget build(BuildContext context) {
    String greeting = getGreeting();
    List<String> splitGreeting = greeting.split(' ');

    IconData greetingIcon;
    if (splitGreeting[1] == "Morning") {
      greetingIcon = Icons.wb_sunny;
    } else if (splitGreeting[1] == "Afternoon") {
      greetingIcon = Icons.wb_cloudy;
    } else if (splitGreeting[1] == "Evening") {
      greetingIcon = Icons.nightlight_round;
    } else {
      greetingIcon = Icons.nights_stay;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 90),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: splitGreeting[0], // Good
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: ' ${splitGreeting[1]}', // Morning, etc.
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF8E3200),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 7),
                  Icon(
                    greetingIcon,
                    size: 30,
                    color: Colors.orange,
                  ),
                  Spacer(),
                  Icon(Icons.notifications, size: 30),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.only(left: 40.0),
              child: const Text(
                'Discover delightful drinks and snacks today',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff282722),
                ),
              ),
            ),
            SizedBox(height: 20),
            _buildSearchBar(),
            SizedBox(height: 20),
            _buildCategoryButtons(),
            SizedBox(height: 20),
            _buildPopularDrinks(products),
            SizedBox(height: 20),
            _buildPopularFoods(products),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Find your favorite menu...',
          prefixIcon: Icon(Icons.search),
          filled: true,
          fillColor: Color(0xffEDE9E9),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildCategoryButton('All'),
            SizedBox(width: 10),
            _buildCategoryButton('Coffee'),
            SizedBox(width: 10),
            _buildCategoryButton('Tea'),
            SizedBox(width: 10),
            _buildCategoryButton('Pastry'),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String text) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xffEDE9E9),
        foregroundColor: Color(0xFF8E3200),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildPopularDrinks(List<Product> products) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular Drinks',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: products.map((product) {
                return _buildProductCard(product);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: 160,
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Image.asset(
              product.imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                product.name,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                product.description,
                style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.price,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Color(0xFF8E3200),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.add),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: Color(0xFF8E3200),
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPopularFoods(List<Product> products) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular Foods',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: products.map((product) {
                return _buildProductCard(product);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'Menu',
        ),
      ],
      selectedItemColor: Color(0xFF8E3200),
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
    );
  }
}
