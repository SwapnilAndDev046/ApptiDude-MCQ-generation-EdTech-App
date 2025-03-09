import 'package:flutter/material.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Frequently Asked Questions',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),

            // Example FAQ items
            _buildFaqItem(
              context,
              'How do I sign up?',
              'Click on the "Sign Up" button on the login screen, fill out the required information, and submit.',
            ),
            const SizedBox(height: 16),
            _buildFaqItem(
              context,
              'How do I reset my password?',
              'Tap on "Forgot Password?" on the login screen. We will send a password reset link to your email.',
            ),
            const SizedBox(height: 16),
            _buildFaqItem(
              context,
              'How can I see my test results?',
              'Go to your Profile, then tap on "Test Results & History" to see your past tests.',
            ),
            const SizedBox(height: 32),

            Text(
              'Contact Us',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),

            // Example contact info
            Text(
              'For any queries or support, feel free to email us at:\n'
              'support@aptidudeapp.com',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),

            // Additional info or placeholders
            Text(
              'Phone: +1 234 567 8900 (9AM - 6PM)',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),

            // You could add more help items, troubleshooting guides, etc.
          ],
        ),
      ),
    );
  }

  Widget _buildFaqItem(BuildContext context, String question, String answer) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          answer,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
