import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:awid_mobile/core/widgets/custom_bottom_nav.dart';

void main() {
  group('CustomBottomNav', () {
    final testItems = [
      BottomNavItem(
        icon: Icons.home,
        label: 'Home',
      ),
      BottomNavItem(
        icon: Icons.search,
        label: 'Search',
      ),
      BottomNavItem(
        icon: Icons.person,
        label: 'Profile',
      ),
    ];

    testWidgets('should display all items', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: CustomBottomNav(
              currentIndex: 0,
              onTap: (_) {},
              items: testItems,
            ),
          ),
        ),
      );

      // Assert
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
    });

    testWidgets('should display icons', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: CustomBottomNav(
              currentIndex: 0,
              onTap: (_) {},
              items: testItems,
            ),
          ),
        ),
      );

      // Assert
      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.person), findsOneWidget);
    });

    testWidgets('should highlight selected item', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: CustomBottomNav(
              currentIndex: 1,
              onTap: (_) {},
              items: testItems,
            ),
          ),
        ),
      );

      // Assert - Selected item should be visible
      expect(find.text('Search'), findsOneWidget);
    });

    testWidgets('should call onTap when item is tapped', (tester) async {
      // Arrange
      var tappedIndex = -1;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: CustomBottomNav(
              currentIndex: 0,
              onTap: (index) => tappedIndex = index,
              items: testItems,
            ),
          ),
        ),
      );

      await tester.tap(find.text('Search'));
      await tester.pumpAndSettle();

      // Assert
      expect(tappedIndex, 1);
    });

    testWidgets('should display badge when count > 0', (tester) async {
      // Arrange
      final itemsWithBadge = [
        BottomNavItem(
          icon: Icons.home,
          label: 'Home',
        ),
        BottomNavItem(
          icon: Icons.notifications,
          label: 'Notifications',
          badge: 5,
        ),
      ];

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: CustomBottomNav(
              currentIndex: 0,
              onTap: (_) {},
              items: itemsWithBadge,
            ),
          ),
        ),
      );

      // Assert
      expect(find.text('5'), findsOneWidget);
    });

    testWidgets('should display 99+ when badge > 99', (tester) async {
      // Arrange
      final itemsWithBadge = [
        BottomNavItem(
          icon: Icons.home,
          label: 'Home',
        ),
        BottomNavItem(
          icon: Icons.notifications,
          label: 'Notifications',
          badge: 150,
        ),
      ];

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: CustomBottomNav(
              currentIndex: 0,
              onTap: (_) {},
              items: itemsWithBadge,
            ),
          ),
        ),
      );

      // Assert
      expect(find.text('99+'), findsOneWidget);
    });

    testWidgets('should not display badge when count is 0', (tester) async {
      // Arrange
      final itemsWithBadge = [
        BottomNavItem(
          icon: Icons.home,
          label: 'Home',
        ),
        BottomNavItem(
          icon: Icons.notifications,
          label: 'Notifications',
          badge: 0,
        ),
      ];

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: CustomBottomNav(
              currentIndex: 0,
              onTap: (_) {},
              items: itemsWithBadge,
            ),
          ),
        ),
      );

      // Assert
      expect(find.text('0'), findsNothing);
    });

    testWidgets('should use active icon when selected', (tester) async {
      // Arrange
      final itemsWithActiveIcon = [
        BottomNavItem(
          icon: Icons.home_outlined,
          activeIcon: Icons.home,
          label: 'Home',
        ),
        BottomNavItem(
          icon: Icons.search,
          label: 'Search',
        ),
      ];

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: CustomBottomNav(
              currentIndex: 0,
              onTap: (_) {},
              items: itemsWithActiveIcon,
            ),
          ),
        ),
      );

      // Assert
      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.home_outlined), findsNothing);
    });

    testWidgets('should use regular icon when not selected', (tester) async {
      // Arrange
      final itemsWithActiveIcon = [
        BottomNavItem(
          icon: Icons.home_outlined,
          activeIcon: Icons.home,
          label: 'Home',
        ),
        BottomNavItem(
          icon: Icons.search,
          label: 'Search',
        ),
      ];

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: CustomBottomNav(
              currentIndex: 1,
              onTap: (_) {},
              items: itemsWithActiveIcon,
            ),
          ),
        ),
      );

      // Assert
      expect(find.byIcon(Icons.home_outlined), findsOneWidget);
      expect(find.byIcon(Icons.home), findsNothing);
    });
  });

  group('AnimatedBottomNav', () {
    final testItems = [
      BottomNavItem(
        icon: Icons.home,
        label: 'Home',
      ),
      BottomNavItem(
        icon: Icons.search,
        label: 'Search',
      ),
      BottomNavItem(
        icon: Icons.person,
        label: 'Profile',
      ),
    ];

    testWidgets('should display all items', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: AnimatedBottomNav(
              currentIndex: 0,
              onTap: (_) {},
              items: testItems,
            ),
          ),
        ),
      );

      // Assert
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
    });

    testWidgets('should animate indicator position', (tester) async {
      // Arrange
      var currentIndex = 0;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: StatefulBuilder(
            builder: (context, setState) => Scaffold(
              bottomNavigationBar: AnimatedBottomNav(
                currentIndex: currentIndex,
                onTap: (index) => setState(() => currentIndex = index),
                items: testItems,
              ),
            ),
          ),
        ),
      );

      // Initial state
      await tester.pumpAndSettle();

      // Tap second item
      await tester.tap(find.text('Search'));
      await tester.pumpAndSettle();

      // Assert
      expect(currentIndex, 1);
    });

    testWidgets('should scale selected icon', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: AnimatedBottomNav(
              currentIndex: 0,
              onTap: (_) {},
              items: testItems,
            ),
          ),
        ),
      );

      // Assert - AnimatedScale should be present
      expect(find.byType(AnimatedScale), findsNWidgets(testItems.length));
    });
  });

  group('BottomNavWithFAB', () {
    final testItems = [
      BottomNavItem(
        icon: Icons.home,
        label: 'Home',
      ),
      BottomNavItem(
        icon: Icons.search,
        label: 'Search',
      ),
      BottomNavItem(
        icon: Icons.notifications,
        label: 'Notifications',
      ),
      BottomNavItem(
        icon: Icons.person,
        label: 'Profile',
      ),
    ];

    testWidgets('should display FAB', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: BottomNavWithFAB(
              currentIndex: 0,
              onTap: (_) {},
              items: testItems,
              onFabPressed: () {},
            ),
          ),
        ),
      );

      // Assert
      expect(find.byType(FloatingActionButton), findsOneWidget);
    });

    testWidgets('should display FAB with custom icon', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: BottomNavWithFAB(
              currentIndex: 0,
              onTap: (_) {},
              items: testItems,
              onFabPressed: () {},
              fabIcon: Icons.camera,
            ),
          ),
        ),
      );

      // Assert
      expect(find.byIcon(Icons.camera), findsOneWidget);
    });

    testWidgets('should call onFabPressed when FAB is tapped',
        (tester) async {
      // Arrange
      var fabPressed = false;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: BottomNavWithFAB(
              currentIndex: 0,
              onTap: (_) {},
              items: testItems,
              onFabPressed: () => fabPressed = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      // Assert
      expect(fabPressed, true);
    });

    testWidgets('should display items on both sides of FAB', (tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: BottomNavWithFAB(
              currentIndex: 0,
              onTap: (_) {},
              items: testItems,
              onFabPressed: () {},
            ),
          ),
        ),
      );

      // Assert
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);
      expect(find.text('Notifications'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
    });
  });

  group('BottomNavItem', () {
    test('should create item with required fields', () {
      // Arrange & Act
      final item = BottomNavItem(
        icon: Icons.home,
        label: 'Home',
      );

      // Assert
      expect(item.icon, Icons.home);
      expect(item.label, 'Home');
      expect(item.activeIcon, Icons.home); // Should default to icon
      expect(item.badge, isNull);
    });

    test('should create item with active icon', () {
      // Arrange & Act
      final item = BottomNavItem(
        icon: Icons.home_outlined,
        activeIcon: Icons.home,
        label: 'Home',
      );

      // Assert
      expect(item.icon, Icons.home_outlined);
      expect(item.activeIcon, Icons.home);
    });

    test('should create item with badge', () {
      // Arrange & Act
      final item = BottomNavItem(
        icon: Icons.notifications,
        label: 'Notifications',
        badge: 5,
      );

      // Assert
      expect(item.badge, 5);
    });
  });
}
