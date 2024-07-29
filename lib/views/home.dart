import 'package:chatapp/constant/color.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          'Chats',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        actions: [
          CircleAvatar(
            backgroundImage:
                const Image(image: AssetImage('assets/user.png')).image,
          )
        ],
      ),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () => Navigator.pushNamed(context,'/chat_page'),
              leading: Stack(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        const Image(image: AssetImage('assets/user.png')).image,
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 6,
                    ),
                  )
                ],
              ),
              title: Text('Other user'),
              subtitle: Text('Hi how are you?'),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CircleAvatar(
                    backgroundColor: primaryColor,
                    radius: 10,
                    child: Text(
                      '10',
                      style: TextStyle(fontSize: 11, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text('20:50')
                ],
              ),
            );
          }),
          floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add),),
    );
  }
}
