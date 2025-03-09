import 'package:flutter/material.dart';
import '../widgets/topic_card.dart';
import '../models/topic_model.dart';
import '../models/test_history_model.dart'; // For TestHistory
import '../databases/database_helper.dart';
import 'profile_screen.dart';
import '../screens/quick_test_selection_screen.dart';
import '../screens/topic_test_selection.dart';
import '../screens/mock_test_selection_screen.dart';
import '../screens/adaptive_test_interface.dart';
import '../screens/about_screen.dart';
import '../screens/help_support_screen.dart';

class DashboardScreen extends StatefulWidget {
  final Map<String, dynamic> user;
  final ValueChanged<bool>? onThemeChanged; // Callback to update global theme

  const DashboardScreen({Key? key, required this.user, this.onThemeChanged})
      : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late Map<String, dynamic> user;
  final List<TopicCategory> _topicCategories = getSampleTopicCategories();
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isDarkMode = false; // Local variable to track dark mode state

  @override
  void initState() {
    super.initState();
    user = Map<String, dynamic>.from(widget.user);

    // Initialize the animation controller
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    // Create a simple opacity animation
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animation
    _animationController.forward();

    // Check the current theme brightness after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isDarkMode = Theme.of(context).brightness == Brightness.dark;
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  /// Fetch overall progress from test history.
  /// It calculates total correct answers (including a baseline 8/10) plus any from DB.
  Future<double> _getOverallProgress() async {
    // If user['id'] is null, return 0.0 to avoid crash
    if (user['id'] == null) {
      return 0.0;
    }

    final history = await DatabaseHelper().getTestHistoryForUser(user['id']);
    if (history.isEmpty) return 0.0;

    // Example: you start with 8 correct out of 10
    int totalCorrect = 8;
    int totalQuestions = 10;
    for (var test in history) {
      totalCorrect += test.score;
      totalQuestions += test.totalQuestions;
    }
    return totalQuestions > 0 ? totalCorrect / totalQuestions : 0.0;
  }

  /// Fetch the 3 most recent tests from DB
  Future<List<TestHistory>> _fetchRecentTest() async {
    if (user['id'] == null) {
      return [];
    }
    final allHistory = await DatabaseHelper().getTestHistoryForUser(user['id']);
    if (allHistory.isEmpty) return [];
    // Sort by date descending
    allHistory.sort((a, b) => b.date.compareTo(a.date));
    // Take top 3
    return allHistory.take(3).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeTransition(
          opacity: _animation,
          child: const Text(
            'AptiDude',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildHomeTab(),
          _buildTestTab(),
          _buildLearnTab(),
          _buildProfileTab(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.quiz_outlined),
            selectedIcon: Icon(Icons.quiz),
            label: 'Test',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book),
            label: 'Learn',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildHomeTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Greeting
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Welcome back, ${user['name'] ?? 'User'}!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          const SizedBox(height: 24),

          // Overall progress
          _buildProgressSection(),
          const SizedBox(height: 24),

          // Recommended
          _buildRecommendedSection(),
        ],
      ),
    );
  }

  // Creates a progress card with title, progress bar and percentage.
  Widget _buildProgressCard({
    required String title,
    required double progress,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: 350,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 12),
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: progress,
                      backgroundColor: color.withOpacity(0.1),
                      color: color,
                      minHeight: 8,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '${(progress * 100).toInt()}%',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Builds the overall progress section using a FutureBuilder.
  Widget _buildProgressSection() {
    return FutureBuilder<double>(
      future: _getOverallProgress(),
      builder: (context, snapshot) {
        final progress = snapshot.data ?? 0.0;
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While waiting for data
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // If there's an error
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Error fetching progress: ${snapshot.error}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Your Progress',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 25),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: SizedBox(
                  height: 160,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    children: [
                      _buildProgressCard(
                        title: 'Overall Progress',
                        progress: progress,
                        icon: Icons.insights,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Widget _buildRecommendedSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Recommended for You',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            final topics =
                _topicCategories.expand((category) => category.topics).toList();
            if (index < topics.length) {
              return TopicCard(
                topic: topics[index],
                onTap: () {
                  Navigator.pushNamed(context, '/learn_section');
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }

  Widget _buildTestTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Test Your Knowledge',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 24),
          _buildTestTypeSection(),
          const SizedBox(height: 24),
          Text(
            'Recent Tests',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          _buildRecentTestsSection(),
        ],
      ),
    );
  }

  Widget _buildTestTypeSection() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: [
        _buildTestTypeCard(
          title: 'Quick Test',
          description: '10 questions from random topics',
          icon: Icons.speed,
          color: Colors.blue,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const QuickTestSelectionScreen(),
              ),
            );
          },
        ),
        _buildTestTypeCard(
          title: 'Topic Test',
          description: 'Test on specific topics',
          icon: Icons.category,
          color: Colors.orange,
          onTap: () {
            final categories = getSampleTopicCategories();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TopicTestSelectionScreen(
                  categories: categories,
                ),
              ),
            );
          },
        ),
        _buildTestTypeCard(
          title: 'Full Mock Test',
          description: 'Complete exam simulation',
          icon: Icons.assignment,
          color: Colors.purple,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MockTestSelectionScreen(
                  user: user,
                ),
              ),
            );
          },
        ),
        _buildTestTypeCard(
          title: 'Adaptive Test',
          description: 'Test that adapts based on your performance',
          icon: Icons.auto_awesome,
          color: Colors.green,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AdaptiveTestInterfaceScreen(),
              ),
            );
          },
        ),
        // New AI MCQ Test Card
        _buildTestTypeCard(
          title: 'AI MCQ',
          description: 'Pre-trained AI model questions',
          icon: Icons.memory,
          color: Colors.red,
          onTap: () {
            // const AIMCTestScreen(),
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AdaptiveTestInterfaceScreen(),
                // Ensure this screen exists
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildTestTypeCard({
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              const SizedBox(height: 8),
              Text(title, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 4),
              Text(description, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }

  /// Fetch the 3 most recent tests from DB
  Future<List<TestHistory>> _fetchRecentTests() async {
    if (user['id'] == null) {
      return [];
    }
    final allHistory = await DatabaseHelper().getTestHistoryForUser(user['id']);
    if (allHistory.isEmpty) return [];
    // Sort by date descending
    allHistory.sort((a, b) => b.date.compareTo(a.date));
    // Take top 3
    return allHistory.take(3).toList();
  }

  Widget _buildRecentTestsSection() {
    return FutureBuilder<List<TestHistory>>(
      future: _fetchRecentTests(),
      builder: (context, snapshot) {
        // 1) While waiting for data
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        // 2) If there's an error
        if (snapshot.hasError) {
          return Card(
            child: ListTile(
              title: Text('Error: ${snapshot.error}'),
            ),
          );
        }

        // 3) If we have data
        final recentTests = snapshot.data ?? [];
        if (recentTests.isEmpty) {
          return Card(
            child: ListTile(
              title: const Text('No recent tests'),
              subtitle: Text(
                'Your test history is empty. Take a test to see it here!',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          );
        }

        // Build a list of the top 3 recent tests
        return Card(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: recentTests.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final test = recentTests[index];

              // Parse the date to compute "days ago"
              DateTime testDate;
              try {
                testDate = DateTime.parse(test.date);
              } catch (_) {
                testDate = DateTime.now();
              }
              final daysDiff = DateTime.now().difference(testDate).inDays;
              final daysAgo = daysDiff == 0
                  ? 'today'
                  : (daysDiff == 1 ? '1 day ago' : '$daysDiff days ago');

              return ListTile(
                title: Text(
                  test.testType.isNotEmpty ? test.testType : 'Unknown Test',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: Text(
                  'Score: ${test.score}/${test.totalQuestions} • $daysAgo',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.play_circle_outline),
                  onPressed: () {
                    // Optionally re-attempt the same test or show a detailed result
                    // For now, do nothing or navigate somewhere if you want
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildLearnTab() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemCount: _topicCategories.length,
      itemBuilder: (context, index) {
        final category = _topicCategories[index];
        return ExpansionTile(
          title: Text(
            category.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          initiallyExpanded: index == 0,
          children: category.topics.map((topic) {
            return TopicCard(
              topic: topic,
              onTap: () {
                Navigator.pushNamed(context, '/learn_section');
              },
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildProfileTab() {
    return SingleChildScrollView(
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
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  user['name'] ?? 'User',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  user['email'] ?? 'No Email',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).textTheme.bodySmall?.color,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Card(
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ListTile(
                  leading: const Icon(Icons.person_outline),
                  title: const Text('Edit Profile'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () async {
                    final updatedUser =
                        await Navigator.push<Map<String, dynamic>>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(user: user),
                      ),
                    );
                    if (updatedUser != null) {
                      setState(() {
                        user = updatedUser;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ListTile(
                  leading: const Icon(Icons.help_outline),
                  title: const Text('Help & Support'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HelpSupportScreen()),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: const Text('About'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AboutScreen(),
                      ),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title:
                      const Text('Logout', style: TextStyle(color: Colors.red)),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
