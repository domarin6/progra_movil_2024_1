import 'export.dart';

class ShoppingExample extends StatelessWidget {
  const ShoppingExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shopping Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/details'),
          child: const Text('Go back to the Details screen'),
        ),
      ),
    );
  }
}
