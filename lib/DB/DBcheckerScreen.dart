import 'package:flutter/material.dart';
import 'sq.dart'; // Import the Sq class

class DBcheckerScreen extends StatefulWidget {
  const DBcheckerScreen({super.key});

  @override
  _DBcheckerScreenState createState() => _DBcheckerScreenState();
}

class _DBcheckerScreenState extends State<DBcheckerScreen> {
  List<Map<String, dynamic>> _users = [];
  List<Map<String, dynamic>> _filteredUsers = [];
  final TextEditingController _searchController = TextEditingController();


  @override
  void initState() {
    super.initState();
    _fetchUsers();
    _searchController.addListener(_filterUsers);
  }

  Future<void> _fetchUsers() async {
    List<Map<String, dynamic>> users = await Sq().getUsers();
    setState(() {
      _users = users;
      _filteredUsers = users;
    });
  }

  void _filterUsers() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredUsers = _users.where((user) {
        return user['email'].toLowerCase().contains(query) || 
        user['password'].toLowerCase().contains(query)
        ;
      }).toList();
    });
  }

  Future<void> _deleteUser(int id) async {
    await Sq().deleteUser(id);
    _fetchUsers();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Database Records'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredUsers.length,
                itemBuilder: (context, index) {
                  final user = _filteredUsers[index];
                  return ListTile(
                    title: Text(user['email']),
                    subtitle: Text('Password: ${user['password']}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _deleteUser(user['id']),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}