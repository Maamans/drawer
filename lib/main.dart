import 'package:flutter/material.dart';
import 'package:drawer/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: Text('Drawer'),
        ),
        body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white
                
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                children: [
                  
                 Icon(Icons.menu_book), 
                 Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 10,),
                    Icon(Icons.notifications)
                  ],
                 )                           
                  
                ],
              ),
              

              
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 18,
                ),
                Text('Popular Books', style: TextStyle(
                  fontSize: 24, 
                  
                ),)
              ],
            ), 
            Container(
              height: 180,
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.8),
                itemCount: 5,
                itemBuilder: (_, i){
                
                return Container(
                  height: 180,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    
                  ),
                  

                );
              }),
            )
          ],
        ),
      ),
      )
    );
  }
}

