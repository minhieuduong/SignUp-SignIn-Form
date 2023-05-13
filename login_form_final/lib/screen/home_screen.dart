import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_form_final/screen/signin_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Bạn đang tìm gì đó...',
            hintStyle: TextStyle(color: Colors.blue, fontSize: 15),
            prefixIcon: Icon(Icons.search, color: Colors.blue),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            suffixIcon: IconButton(
              icon: Icon(Icons.clear, color: Colors.white),
              onPressed: () {
                // Xử lý xóa nội dung tìm kiếm
              },
            ),
          ),

        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Điều hướng đến giỏ hàng
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Name"),
                accountEmail: Text("nguoidung@example.com"),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Trang chủ'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.computer),
                title: Text('Đồ công nghệ'),
                onTap: () {
                  Navigator.pop(context);
                  // Điều hướng đến trang đồ công nghệ
                },
              ),
              ListTile(
                leading: Icon(Icons.kitchen_sharp),
                title: Text('Đồ gia dụng'),
                onTap: () {
                  Navigator.pop(context);
                  // Điều hướng đến trang đồ gia dụng
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Đăng xuất'),
                onTap: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    print("Đăng xuất");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignInScreen()),
                    );
                  });
                },
              ),
            ],
          ),
        ),
      ),
        body: Center(
        child: Text('Nội dung trang chủ'),
      ),
    );
  }
}

