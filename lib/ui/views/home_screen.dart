import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../controllers/blocs/home_button/home_button_bloc.dart';
import '../../controllers/blocs/home_carousel/home_carousel_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _exitDialog(context);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BCS eBook'),
          actions: [
            Transform.translate(
              offset: const Offset(-10, 0),
              child: const CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                  'https://cdn.pixabay.com/photo/2016/11/29/06/08/woman-1867715__480.jpg',
                ),
              ),
            )
          ],
        ),
        drawer: const Drawer(),
        body: BlocBuilder<HomeButtonBloc, HomeButtonState>(
          builder: (context, btnState) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  primary: false,
                  automaticallyImplyLeading: false,
                  expandedHeight: 120,
                  flexibleSpace: FlexibleSpaceBar(
                    background:
                        BlocBuilder<HomeCarouselBloc, HomeCarouselState>(
                      builder: (context, state) {
                        if (state is HomeCarouselLoaded) {
                          return CarouselSlider.builder(
                            itemCount: state.value.length,
                            itemBuilder: (_, idx, rIdx) {
                              return Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Card(
                                    // elevation: 4.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: carouselRadius,
                                    ),
                                    child: Container(
                                      height: double.maxFinite,
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                        borderRadius: carouselRadius,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: CachedNetworkImageProvider(
                                            state.value[idx].imgSrc,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    child: AnimatedSmoothIndicator(
                                      activeIndex: state.activeIndex,
                                      count: state.value.length,
                                      effect: ExpandingDotsEffect(
                                        dotHeight: 5,
                                        activeDotColor:
                                            Theme.of(context).primaryColor,
                                        dotColor: Colors.white60,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                            options: CarouselOptions(
                              initialPage: state.activeIndex,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              viewportFraction: 0.9,
                              onPageChanged: (idx, rsn) {
                                context
                                    .read<HomeCarouselBloc>()
                                    .add(ActiveIndexUpdateCarouselEvent(idx));
                              },
                            ),
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      },
                    ),
                  ),
                  elevation: 0.0,
                ),
                // SliverList(
                //   delegate: SliverChildBuilderDelegate(
                //     (context, index) => ListTile(
                //       title: Text('Item $index'),
                //     ),
                //     childCount: 20,
                //   ),
                // ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 10,
                  ),
                  sliver: SliverGrid.builder(
                    itemCount: btnState.buttonList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 16 / 9,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                    ),
                    itemBuilder: (_, index) {
                      final item = btnState.buttonList[index];
                      return InkWell(
                        onTap: () {
                          context
                              .read<HomeButtonBloc>()
                              .add(HomeButtonEvent(index));
                        },
                        borderRadius: carouselRadius,
                        splashColor: item.color.first,
                        child: Card(
                          shadowColor: item.color.last,
                          surfaceTintColor: item.color.first,
                          shape: RoundedRectangleBorder(
                            borderRadius: carouselRadius,
                          ),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: carouselRadius,
                              gradient: LinearGradient(
                                colors: [
                                  item.color.first.withOpacity(0.2),
                                  item.color.last.withOpacity(0.2),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            item.label,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                            height: double.maxFinite,
                                            width: double.maxFinite,
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  child: Transform.scale(
                                                    scale: 0.5,
                                                    child: Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: Switch(
                                                        onChanged:
                                                            (bool value) {},
                                                        value: btnState
                                                                .activeIndex ==
                                                            index,
                                                        // activeColor: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const Spacer(),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 5,
                                          horizontal: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.black12,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Icon(
                                          item.icon,
                                          size: 16,
                                          color: item.color.first,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _exitDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Are you sure to close this app?"),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("No"),
                ),
                const SizedBox(width: 15),
                OutlinedButton(
                  onPressed: () => SystemNavigator.pop(),
                  child: const Text("Yes"),
                ),
              ],
            ),
          );
        },
      );

  BorderRadius get carouselRadius => BorderRadius.circular(15);
}


///
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
    // final double statusBarHeight = MediaQuery.of(context).padding.top;
    // final double appBarHeight = kToolbarHeight + statusBarHeight;

    // return Scaffold(
    //   body: CustomScrollView(
    //     slivers: [
    //       SliverAppBar(
    //         expandedHeight: 200.0,
    //         flexibleSpace: FlexibleSpaceBar(
    //           background: Stack(
    //             children: [
    //               CarouselSlider(
    //                 options: CarouselOptions(
    //                   height: 200.0,
    //                   autoPlay: true,
    //                   enlargeCenterPage: true,
    //                   viewportFraction: 0.9,
    //                 ),
    //                 items: [
    //                   Container(
    //                     decoration: BoxDecoration(
    //                       image: DecorationImage(
    //                         image: AssetImage('assets/images/image1.jpg'),
    //                         fit: BoxFit.cover,
    //                       ),
    //                     ),
    //                   ),
    //                   Container(
    //                     decoration: BoxDecoration(
    //                       image: DecorationImage(
    //                         image: AssetImage('assets/images/image2.jpg'),
    //                         fit: BoxFit.cover,
    //                       ),
    //                     ),
    //                   ),
    //                   Container(
    //                     decoration: BoxDecoration(
    //                       image: DecorationImage(
    //                         image: AssetImage('assets/images/image3.jpg'),
    //                         fit: BoxFit.cover,
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               Positioned(
    //                 bottom: 0,
    //                 left: 0,
    //                 right: 0,
    //                 child: Container(
    //                   decoration: BoxDecoration(
    //                     gradient: LinearGradient(
    //                       begin: Alignment.topCenter,
    //                       end: Alignment.bottomCenter,
    //                       colors: [
    //                         Colors.transparent,
    //                         Colors.black54,
    //                       ],
    //                     ),
    //                   ),
    //                   padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    //                   child: Text(
    //                     'Carousel Slider on SliverAppBar Demo',
    //                     style: TextStyle(
    //                       fontSize: 24.0,
    //                       fontWeight: FontWeight.bold,
    //                       color: Colors.white,
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         pinned: true,
    //         floating: false,
    //         snap: false,
    //         elevation: 0.0,
    //         backgroundColor: Colors.transparent,
    //         iconTheme: IconThemeData(color: Colors.white),
    //         actions: [
    //           IconButton(
    //             icon: Icon(Icons.search),
    //             onPressed: () {},
    //           ),
    //         ],
    //       ),
    //       SliverList(
    //         delegate: SliverChildBuilderDelegate(
    //           (context, index) => ListTile(
    //             title: Text('Item $index'),
    //           ),
    //           childCount: 20,
    //         ),
    //       ),
    //     ],
    //   ),
    // );
//   }
// }
