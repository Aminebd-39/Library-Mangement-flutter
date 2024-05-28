import 'package:flutter/material.dart';

import '../models/Member.dart';
import 'main.dart';

class MembersWidget extends StatefulWidget {
  const MembersWidget({Key? key}) : super(key: key);

  @override
  _MembersWidgetState createState() => _MembersWidgetState();
}

class _MembersWidgetState extends State<MembersWidget> {
  late List<Member> members = [
    Member(
      name: "Aisha El Idrissi",
      email: "aisha.el.idrissi@example.ma",
      phone: "+212654321098",
      address: "23 Rue Hassan II, Marrakech 40000, Morocco",
      imageUrl: "https://picsum.photos/id/237/200/300",
    ),
    Member(
      name: "Omar Benjelloun",
      email: "omar.benjelloun@example.ma",
      phone: "+212612345678",
      address: "147 Boulevard Mohammed V, Casablanca 20000, Morocco",
      imageUrl: "https://picsum.photos/id/847/200/300",
    ),
    Member(
      name: "Fatima Lahcen",
      email: "fatima.lahcen@example.ma",
      phone: "+212789012345",
      address: "5 Rue Ibn Battuta, Rabat 10000, Morocco",
      imageUrl: "https://picsum.photos/id/1025/200/300",
    ),
    Member(
      name: "Youssef Alaoui",
      email: "youssef.alaoui@example.ma",
      phone: "+212698765432",
      address: "7 Derb Omar, Fes 30000, Morocco",
      imageUrl: "https://picsum.photos/id/238/200/300",
    ),
    Member(
      name: "Laila Mernissi",
      email: "laila.mernissi@example.ma",
      phone: "+212701234567",
      address: "32 Avenue Hassan Ier, Agadir 80000, Morocco",
      imageUrl: "https://picsum.photos/id/1074/200/300",
    ),
  ];

  void _showMemberDetails(BuildContext context, Member member) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => _buildMemberDetails(context, member),
      ),
    );
  }

  // Widget _buildMemberDetails(BuildContext context, Member member) {
  //   return Scaffold(
  //       appBar: AppBar(
  //         title: Text(member.name),
  //       ),
  //       body: Card(
  //           color: Colors.grey[300],
  //           elevation: 8.0,
  //           child: Container(
  //             padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
  //             height: 200,
  //             width: 350,
  //             child: Column(
  //               children: [
  //                 const CircleAvatar(
  //                   radius: 50, //we give the image a radius of 50
  //                   backgroundImage: NetworkImage(
  //                       'https://webstockreview.net/images/male-clipart-professional-man-3.jpg'),
  //                 ),
  //                 Column(
  //                   crossAxisAlignment: CrossAxisAlignment.end,
  //                   children: [
  //                     Container(
  //                       margin: const EdgeInsets.only(top: 8),
  //                       width: 150,
  //                       color: Colors.black54,
  //                       height: 2,
  //                     ),
  //                     const SizedBox(height: 4),
  //                     const Text('+2348012345678'),
  //                     const Text('Chelsea City'),
  //                     const Text('Flutteria'),
  //                   ],
  //                 ),
  //                 const SizedBox(height: 20),
  //               ],
  //             ),
  //           )));
  // }

  Widget _buildMemberDetails(BuildContext context, Member member) {
    return Scaffold(
      appBar: AppBar(
        title: Text(member.name),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(member.imageUrl),
                radius: 50.0, // Adjust image size as needed
              ),
              SizedBox(height: 16.0), // Add some spacing
              Text(member.email, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(member.phone),
              Text(member.address),
            ],
          ),
        ),
      )
    );
  }

  void _addMember(Member member) {
    setState(() {
      members.add(member);
    });
  }

  void _showAddMemberDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final _nameController = TextEditingController();
        final _emailController = TextEditingController();
        final _phoneController = TextEditingController();
        final _addressController = TextEditingController();
        final _imageUrlController = TextEditingController();

        return AlertDialog(
          title: const Text('Add Member'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min, // Avoid potential overflow
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                TextField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Phone',
                  ),
                ),
                TextField(
                  controller: _addressController,
                  decoration: const InputDecoration(
                    labelText: 'Address',
                  ),
                  maxLines: 3, // Allow for multi-line address
                ),
                TextField(
                  controller: _imageUrlController,
                  decoration: const InputDecoration(
                    labelText: 'Image URL (optional)',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Validate and add member
                final name = _nameController.text;
                final email = _emailController.text;
                final phone = _phoneController.text;
                final address = _addressController.text;
                final imageUrl = _imageUrlController.text;

                if (name.isEmpty || email.isEmpty || phone.isEmpty || address.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill out all required fields')),
                  );
                  return;
                }

                _addMember(Member(name: name, email: email, phone: phone, address: address, imageUrl: imageUrl)); // Call add member function
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Members list"),
      ),
      body: Center(
        child: Expanded(
          child: ListView.builder(
            itemCount: members.length,
            itemBuilder: (context, index) {
              final member = members[index];
              return GestureDetector(
                  onTap: () => _showMemberDetails(
                      context, member), // Call details function
                  child: Card(
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: member.imageUrl.isNotEmpty
                          ? CircleAvatar(
                              // Use CircleAvatar for a round image
                              backgroundImage: NetworkImage(member.imageUrl),
                            )
                          : const Icon(Icons
                              .person), // Placeholder if no image available
                      title: Text(member.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(member.email),
                          Text(member.phone),
                          Text(member.address),
                        ],
                      ),
                    ),
                  ));
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddMemberDialog();
        },
        tooltip: 'Add books',
        child: const Icon(Icons.add),
      ),
      drawer: const CustomDrawer(),
    );
  }
}
