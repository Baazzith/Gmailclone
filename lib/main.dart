import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  PageController _pageController = PageController();
  List<bool> isStarred = List.generate(15, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GMAIL CLONE',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 235, 28, 13),
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage(
                'images/image1.heic'),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: [
          ListView.builder(
            itemCount: 16,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Email $index'),
                subtitle: const Text('Subject'),
                trailing: IconButton(
                  icon: Icon(
                    isStarred[index] ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                  ),
                  onPressed: () {
                    setState(() {
                      isStarred[index] = !isStarred[index];
                    });
                  },
                ),
              );
            },
          ),

          // Second Page - Meet Section
          const Center(
            child: Text('Meet Section'),
          ),
        ],
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Mails',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call),
            label: 'Meet',
          ),
        ],
      ),
      drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show Snackbar on FAB click
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Compose feature in progress'),
            ),
          );
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 235, 28, 13),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                      'images/image1.heic'),
                ),
                SizedBox(height: 2),
                Text(
                  'Bazith Ali',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'baazzith@gmail.com',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text('Sent'),
            onTap: () {
              // Handle drawer item click if needed
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Recieved'),
            onTap: () {
              // Handle drawer item click if needed
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Spam'),
            onTap: () {
              // Handle drawer item click if needed
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}