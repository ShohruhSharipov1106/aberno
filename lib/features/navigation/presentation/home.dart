import 'package:aberno_test/assets/colors/colors.dart';
import 'package:aberno_test/assets/constants/icons.dart';
import 'package:aberno_test/features/navigation/domain/entity/nav_bar.dart';
import 'package:aberno_test/features/navigation/presentation/widgets/nav_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'navigator.dart';

enum NavItemEnum { home, folder, add, chat, profile }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => const HomeScreen());

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _controller;

  final Map<NavItemEnum, GlobalKey<NavigatorState>> _navigatorKeys = {
    NavItemEnum.home: GlobalKey<NavigatorState>(),
    NavItemEnum.folder: GlobalKey<NavigatorState>(),
    NavItemEnum.add: GlobalKey<NavigatorState>(),
    NavItemEnum.chat: GlobalKey<NavigatorState>(),
    NavItemEnum.profile: GlobalKey<NavigatorState>(),
  };

  final List<NavBar> labels = const [
    NavBar(
      id: 0,
      icon: AppIcons.home,
    ),
    NavBar(
      id: 1,
      icon: AppIcons.folder,
    ),
    NavBar(
      id: 2,
      icon: AppIcons.add,
      isCenter: true,
    ),
    NavBar(
      id: 3,
      icon: AppIcons.chat,
    ),
    NavBar(
      id: 4,
      icon: AppIcons.profile,
    ),
  ];

  int _currentIndex = 0;

  @override
  void initState() {
    _controller = TabController(length: labels.length, vsync: this);
    _controller.addListener(onTabChange);

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
        overlays: SystemUiOverlay.values);
    super.initState();
  }

  void onTabChange() => setState(() => _currentIndex = _controller.index);

  Widget _buildPageNavigator(NavItemEnum tabItem) => TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      );

  void changePage(int index) {
    setState(() => _currentIndex = index);
    _controller.animateTo(index);
  }

  @override
  Widget build(BuildContext context) => HomeTabControllerProvider(
        controller: _controller,
        child: PopScope(
          onPopInvoked: (value) async {
            final isFirstRouteInCurrentTab =
                !await _navigatorKeys[NavItemEnum.values[_currentIndex]]!
                    .currentState!
                    .maybePop();
            if (isFirstRouteInCurrentTab) {
              changePage(0);
              return Future.value(false);
            }
            return Future.value(isFirstRouteInCurrentTab);
          },
          child: AnnotatedRegion(
            value: const SystemUiOverlayStyle(
              systemNavigationBarColor: Colors.transparent,
              systemNavigationBarContrastEnforced: false,
              systemNavigationBarIconBrightness: Brightness.dark,
              systemStatusBarContrastEnforced: false,
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
            ),
            child: Scaffold(
              backgroundColor: white,
              extendBody: true,
              resizeToAvoidBottomInset: true,
              bottomNavigationBar: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom),
                  height: 64 + MediaQuery.of(context).padding.bottom,
                  decoration: BoxDecoration(
                    color: white,
                    border: Border.all(color: Colors.transparent),
                  ),
                  child: TabBar(
                    enableFeedback: true,
                    onTap: (index) {},
                    controller: _controller,
                    indicatorPadding: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    labelPadding: EdgeInsets.zero,
                    indicatorColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 0,
                    indicator: const BoxDecoration(),
                    dividerColor: Colors.transparent,
                    tabs: List.generate(
                      labels.length,
                      (index) => NavItemWidget(
                        navBar: labels[index],
                        currentIndex: _currentIndex,
                      ),
                    ),
                  ),
                ),
              ),
              body: TabBarView(
                controller: _controller,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                  NavItemEnum.values.length,
                  (index) => _buildPageNavigator(
                    NavItemEnum.values[index],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}

class HomeTabControllerProvider extends InheritedWidget {
  final TabController controller;

  const HomeTabControllerProvider({
    super.key,
    required super.child,
    required this.controller,
  });

  static HomeTabControllerProvider of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<HomeTabControllerProvider>();
    assert(result != null, 'No HomeTabControllerProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(HomeTabControllerProvider oldWidget) => false;
}
