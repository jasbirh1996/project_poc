import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'LoginPage.dart';
import 'SignupPage.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Scheduler',
              style: TextStyle(
                // Adjust the font size
                color: Colors.white, // Change the text color to green
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10.0), // Adjust the radius as needed
                ),
                elevation: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  // Match the Card's borderRadius
                  child: Container(
                    height: 200.0,
                    width: double.infinity, // Match the parent's width
                    child: Image.network(
                      'https://www.dssliveindia.com/images/team2.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 60.0),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                // 20 pixels margin on both sides
                child: ElevatedButton(
                  onPressed: () {
                    // Add your button's onPressed logic here
                    Get.to(SignUpPage());
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    // Set the background color to light orange
                    padding: EdgeInsets.all(16.0), // Add padding to the button
                  ),
                  child: Container(
                    width: double.infinity, // Match parent width
                    child: const Center(
                      child: Text('SignUp'),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                // 20 pixels margin on both sides
                child: ElevatedButton(
                  onPressed: () {
                    // Add your button's onPressed logic here
                    Get.to(LoginPage());
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    // Set the background color to light orange
                    padding: EdgeInsets.all(16.0), // Add padding to the button
                  ),
                  child: Container(
                    width: double.infinity, // Match parent width
                    child: const Center(
                      child: Text('Login'),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Get.to(() => LoginPage()),
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: () => Get.to(() => SignUpPage()),
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}*/
