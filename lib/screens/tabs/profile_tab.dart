import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 12),
          CircleAvatar(
            radius: 56,
            backgroundImage: const AssetImage('assets/img/profile.jpg'),
            onBackgroundImageError: (_, __) {},
          ),
          const SizedBox(height: 16),
          Text('THY Bunrong',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(height: 4),
          Text('Flutter Enthusiast · PhoneShop App',
              style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 16),
          Card(
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ListTile(
                    leading: Icon(Icons.email_outlined),
                    title: Text('Email'),
                    subtitle: Text('you@example.com'),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.phone_outlined),
                    title: Text('Phone'),
                    subtitle: Text('+855 12 345 678'),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.info_outline),
                    title: Text('About'),
                    subtitle: Text('This is a demo profile for THY Bunrong.'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.edit_outlined),
            label: const Text('Edit Profile (TBD)'),
          ),
        ],
      ),
    );
  }
}
