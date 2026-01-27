import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:awid_mobile/core/widgets/custom_app_bar.dart';
import 'package:awid_mobile/core/theme/app_colors.dart';

void main() {
  group('CustomAppBar', () {
    testWidgets('should display title', (tester) async {
      // Arrange
      const title = 'Test Title';

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: const CustomAppBar(title: title),
          ),
        ),
      );

      // Assert
      expect(find.text(title), findsOneWidget);
    });

    testWidgets('should center title by default', (tester) async {
      // Arrange
      const title = 'Test Title';

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: const CustomAppBar(title: title),
          ),
        ),
      );

      // Assert
      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.centerTitle, true);
    });

    testWidgets('should not center title when specified', (tester) async {
      // Arrange
      const title = 'Test Title';

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: const CustomAppBar(
              title: title,
              centerTitle: false,
            ),
          ),
        ),
      );

      // Assert
      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.centerTitle, false);
    });

    testWidgets('should display back button when can pop', (tester) async {
      // Arrange
      const title = 'Test Title';

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Scaffold(
                      appBar: const CustomAppBar(title: title),
                    ),
                  ),
                ),
                child: const Text('Navigate'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Navigate'));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    });

    testWidgets('should call onBackPressed when back button is tapped',
        (tester) async {
      // Arrange
      const title = 'Test Title';
      var backPressed = false;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Scaffold(
                      appBar: CustomAppBar(
                        title: title,
                        onBackPressed: () => backPressed = true,
                      ),
                    ),
                  ),
                ),
                child: const Text('Navigate'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Navigate'));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      // Assert
      expect(backPressed, true);
    });

    testWidgets('should display actions', (tester) async {
      // Arrange
      const title = 'Test Title';

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: CustomAppBar(
              title: title,
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      );

      // Assert
      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('should use custom background color', (tester) async {
      // Arrange
      const title = 'Test Title';
      const customColor = Colors.red;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: const CustomAppBar(
              title: title,
              backgroundColor: customColor,
            ),
          ),
        ),
      );

      // Assert
      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.backgroundColor, customColor);
    });

    testWidgets('should use custom foreground color', (tester) async {
      // Arrange
      const title = 'Test Title';
      const customColor = Colors.black;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: const CustomAppBar(
              title: title,
              foregroundColor: customColor,
            ),
          ),
        ),
      );

      // Assert
      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.foregroundColor, customColor);
    });

    testWidgets('should use custom elevation', (tester) async {
      // Arrange
      const title = 'Test Title';
      const customElevation = 10.0;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: const CustomAppBar(
              title: title,
              elevation: customElevation,
            ),
          ),
        ),
      );

      // Assert
      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.elevation, customElevation);
    });

    testWidgets('should display bottom widget', (tester) async {
      // Arrange
      const title = 'Test Title';

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: CustomAppBar(
              title: title,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: Container(
                  height: 50,
                  color: Colors.blue,
                  child: const Text('Bottom'),
                ),
              ),
            ),
          ),
        ),
      );

      // Assert
      expect(find.text('Bottom'), findsOneWidget);
    });
  });

  group('NotificationAppBar', () {
    testWidgets('should display notification icon', (tester) async {
      // Arrange
      const title = 'Test Title';

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: const NotificationAppBar(title: title),
          ),
        ),
      );

      // Assert
      expect(find.byIcon(Icons.notifications), findsOneWidget);
    });

    testWidgets('should display notification badge when count > 0',
        (tester) async {
      // Arrange
      const title = 'Test Title';
      const count = 5;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: const NotificationAppBar(
              title: title,
              notificationCount: count,
            ),
          ),
        ),
      );

      // Assert
      expect(find.text('$count'), findsOneWidget);
    });

    testWidgets('should not display badge when count is 0', (tester) async {
      // Arrange
      const title = 'Test Title';

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: const NotificationAppBar(
              title: title,
              notificationCount: 0,
            ),
          ),
        ),
      );

      // Assert
      expect(find.text('0'), findsNothing);
    });

    testWidgets('should display 99+ when count > 99', (tester) async {
      // Arrange
      const title = 'Test Title';
      const count = 150;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: const NotificationAppBar(
              title: title,
              notificationCount: count,
            ),
          ),
        ),
      );

      // Assert
      expect(find.text('99+'), findsOneWidget);
    });

    testWidgets('should call onNotificationPressed when icon is tapped',
        (tester) async {
      // Arrange
      const title = 'Test Title';
      var pressed = false;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: NotificationAppBar(
              title: title,
              onNotificationPressed: () => pressed = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.notifications));
      await tester.pumpAndSettle();

      // Assert
      expect(pressed, true);
    });
  });

  group('SearchAppBar', () {
    testWidgets('should display title initially', (tester) async {
      // Arrange
      const title = 'Test Title';

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: const SearchAppBar(title: title),
          ),
        ),
      );

      // Assert
      expect(find.text(title), findsOneWidget);
    });

    testWidgets('should display search icon initially', (tester) async {
      // Arrange
      const title = 'Test Title';

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: const SearchAppBar(title: title),
          ),
        ),
      );

      // Assert
      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('should show search field when search icon is tapped',
        (tester) async {
      // Arrange
      const title = 'Test Title';

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: const SearchAppBar(title: title),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.search));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(TextField), findsOneWidget);
      expect(find.byIcon(Icons.close), findsOneWidget);
    });

    testWidgets('should hide search field when close icon is tapped',
        (tester) async {
      // Arrange
      const title = 'Test Title';

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: const SearchAppBar(title: title),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.search));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(TextField), findsNothing);
      expect(find.text(title), findsOneWidget);
    });

    testWidgets('should call onSearchChanged when text changes',
        (tester) async {
      // Arrange
      const title = 'Test Title';
      String? searchQuery;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: SearchAppBar(
              title: title,
              onSearchChanged: (query) => searchQuery = query,
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.search));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'test query');
      await tester.pumpAndSettle();

      // Assert
      expect(searchQuery, 'test query');
    });
  });

  group('TabAppBar', () {
    testWidgets('should display tabs', (tester) async {
      // Arrange
      const title = 'Test Title';
      final tabs = [
        const Tab(text: 'Tab 1'),
        const Tab(text: 'Tab 2'),
      ];

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: TabAppBar(
                title: title,
                tabs: tabs,
              ),
            ),
          ),
        ),
      );

      // Assert
      expect(find.text('Tab 1'), findsOneWidget);
      expect(find.text('Tab 2'), findsOneWidget);
    });

    testWidgets('should display title and tabs', (tester) async {
      // Arrange
      const title = 'Test Title';
      final tabs = [
        const Tab(text: 'Tab 1'),
        const Tab(text: 'Tab 2'),
      ];

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: TabAppBar(
                title: title,
                tabs: tabs,
              ),
            ),
          ),
        ),
      );

      // Assert
      expect(find.text(title), findsOneWidget);
      expect(find.byType(TabBar), findsOneWidget);
    });
  });
}
