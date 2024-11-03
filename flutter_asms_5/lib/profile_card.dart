import 'package:flutter/material.dart';

class ProfileCard extends StatefulWidget {
  final String name;
  final String description;
  final String imagePath;

  const ProfileCard({
    required this.name,
    required this.description,
    required this.imagePath,
    super.key,
  });

  @override
  State<ProfileCard> createState() {
    return _ProfileCardState();
  }
}

class _ProfileCardState extends State<ProfileCard> {
  bool _isProfileVisible = false; // Track if the description should be visible
  late TextEditingController _controller;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _passwordController = TextEditingController();
  }

  void _toggleProfileVisibility() {
    if(_passwordController.text == "12345"){
    setState(() {
      _isProfileVisible = !_isProfileVisible;
    });
    }else{
      showDialog<void>(context: context, builder: (BuildContext context){
        return AlertDialog(
          title: const Text('Incorrect password'),
          content: const Text('Please enter the correct pass to view the profile.'),
          actions: <Widget>[
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text('Ok'),
            ),
          ],
        );
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              widget.imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.name,
            style: const TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Enter password',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _toggleProfileVisibility,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text('View Profile'),
          ),
          const SizedBox(height: 10),
          if (_isProfileVisible) // Conditionally display description
            Text(
              widget.description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
          const SizedBox(height: 80),
          const Text(
            'Type to this if you has question for me',
            style: TextStyle(
                fontSize: 15,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: _controller,
            onSubmitted: (String value) async {
              await showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Question Sent'),
                      content: const Text('Thank you for send question'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Ok'),
                        )
                      ],
                    );
                  });
            },
            decoration: const InputDecoration(
              labelText: 'Ask a question',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.question_answer), // Add an icon here
            ),
          ),
        ],
      ),
    );
  }
}
