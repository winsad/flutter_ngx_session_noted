import 'package:flutter/material.dart';
import 'package:flutter_mobile_application/app/app_colors.dart';
import 'package:flutter_mobile_application/providers/home_provider.dart';
import 'package:flutter_mobile_application/widgets/news_list_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeProvider>().fetchNews();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<HomeProvider>(
        builder: (BuildContext context, provider, _) {
          return SafeArea(
            child: Padding(
              padding: .symmetric(horizontal: 16, vertical: 10),
              child: Column(
                spacing: 10,
                crossAxisAlignment: .start,
                children: [
                  // header
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            'NGX News',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: .bold,
                              letterSpacing: -0.5,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          Text(
                            'Top Headlines',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: .normal,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: ClipOval(
                          child: Image.asset('assets/images/app_icon.jpg'),
                        ),
                      ),
                    ],
                  ),

                  // category filter
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 10,
                      children: HomeProvider.categories.map((String e) {
                        bool isSelected = provider.selectedCategory == e;

                        return GestureDetector(
                          onTap: () => context
                              .read<HomeProvider>()
                              .onSelectedCategory(e),
                          child: Container(
                            padding: .symmetric(horizontal: 16, vertical: 5),
                            alignment: .center,
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.blue : Colors.white,
                              borderRadius: .circular(20),
                              border: .all(
                                color: !isSelected ? Colors.blue : Colors.white,
                              ),
                            ),
                            child: Text(
                              e[0].toUpperCase() + e.substring(1),
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : AppColors.textSecondary,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  // news listing
                  Expanded(
                    child: Consumer<HomeProvider>(
                      builder: (context, provider, _) {
                        return NewsListWidget(
                          news: provider.news,
                          isLoading: provider.loading,
                          isLoadingMore: provider.isLoadingMore,
                          error: provider.error,
                          onRefresh: provider.fetchNews,
                          onLoadMore: provider.fetchMoreNews,
                          showCategory: true,
                          hasNextPage: provider.hasNextPage,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
