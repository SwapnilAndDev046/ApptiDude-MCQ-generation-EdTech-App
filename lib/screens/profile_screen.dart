import 'package:flutter/material.dart';
import '../databases/database_helper.dart';

class ProfileScreen extends StatefulWidget {
  final Map<String, dynamic> user;

  const ProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Map<String, dynamic> user;

  @override
  void initState() {
    super.initState();
    // Make a local copy of the user map
    user = Map<String, dynamic>.from(widget.user);
  }

  Future<void> _editProfile() async {
    // Controllers pre-filled with current user data
    TextEditingController nameController =
        TextEditingController(text: user['name']);
    TextEditingController emailController =
        TextEditingController(text: user['email']);

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Profile"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              const SizedBox(height: 12), // Added space
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "Email"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () async {
                user['name'] = nameController.text.trim();
                user['email'] = emailController.text.trim();

                // Update in SQLite
                int result = await DatabaseHelper().updateUser(user);
                if (result > 0) {
                  Navigator.pop(context); // Close dialog

                  // Return updated data to previous screen
                  Navigator.pop(context, user);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Profile updated successfully")),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Profile update failed")),
                  );
                }
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String name = user['name'] ?? 'No Name';
    String email = user['email'] ?? 'No Email';

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor:
                        Theme.of(context).primaryColor.withOpacity(0.1),
                    child: Icon(Icons.person,
                        size: 50, color: Theme.of(context).primaryColor),
                  ),
                  const SizedBox(height: 16),
                  Text(name, style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).textTheme.bodySmall?.color,
                        ),
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton.icon(
                    onPressed: _editProfile,
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit Profile'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
