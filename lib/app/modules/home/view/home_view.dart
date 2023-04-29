import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_sample/app/constants/app_url.dart';
import 'package:getx_api_sample/app/model/details.dart';
import 'package:getx_api_sample/app/modules/home/controller/home_controller.dart';
import 'package:getx_api_sample/app/modules/home/controller/popular_controller.dart';
import 'package:getx_api_sample/app/modules/home/controller/top_rated_controller.dart';
import 'package:getx_api_sample/app/modules/home/controller/upcoming_controller.dart';
import 'package:getx_api_sample/app/modules/home/view/details_screen_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  HomeController get controller => Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    PopularController popularController = Get.put(PopularController());
    TopRatedController topRatedController = Get.put(TopRatedController());
    UpComingController upComingController = Get.put(UpComingController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile2.png'),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white60,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
            // floating: true,
            pinned: true,
            expandedHeight: 350.0,
            flexibleSpace: FlexibleSpaceBar(
              // title: const Text('Goa', textScaleFactor: 3),
              background: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(
                  'assets/images/img2.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Trending now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    child: controller.obx(
                      (state) => ListView.builder(
                        key: const Key('i'),
                        scrollDirection: Axis.horizontal,
                        itemCount: state!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: CachedNetworkImage(
                                      imageUrl: state[index].imageurl!,
                                      imageBuilder: (context, imageProvider) => Image(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                      placeholder: (context, url) => const SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: Center(child: CircularProgressIndicator()),
                                      ),
                                      errorWidget: (context, url, error) => const Icon(Icons.error),
                                      height: 180,
                                      width: 300,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  state[index].team!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const Text(
                    'Popular',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: popularController.obx(
                      (state) => ListView.builder(
                          key: const Key('ppp'),
                          scrollDirection: Axis.horizontal,
                          itemCount: state!.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: 180,
                              child: Hero(
                                tag: '${state[index].id}/popular',
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      final DetailsModel popular = DetailsModel(
                                        key: '${state[index].id}/popular',
                                        image: AppUrl.imgUrl + state[index].backdropPath,
                                        title: state[index].originalTitle,
                                        description: state[index].overview,
                                        average: state[index].voteAverage,
                                      );
                                      Get.to(() => DetailsScreenView(details: popular), arguments: index);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: CachedNetworkImage(
                                          imageUrl: AppUrl.imgUrl + state[index].posterPath,
                                          imageBuilder: (context, imageProvider) => Image(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                          placeholder: (context, url) => const SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: Center(child: CircularProgressIndicator()),
                                          ),
                                          errorWidget: (context, url, error) => const Icon(Icons.error),
                                          height: 180,
                                          width: 300,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  const Text(
                    'Top Rated',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: topRatedController.obx(
                      (state) => ListView.builder(
                          key: const Key('ttt'),
                          scrollDirection: Axis.horizontal,
                          itemCount: state!.length,
                          itemBuilder: (context, index) {
                            return Hero(
                              tag: '${state[index].id}/top',
                              child: SizedBox(
                                width: 180,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      final DetailsModel topRated = DetailsModel(
                                        key: '${state[index].id}/top',
                                        image: AppUrl.imgUrl + state[index].backdropPath,
                                        title: state[index].originalTitle,
                                        description: state[index].overview,
                                        average: state[index].voteAverage,
                                      );
                                      Get.to(() => DetailsScreenView(details: topRated), arguments: index);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: CachedNetworkImage(
                                          imageUrl: AppUrl.imgUrl + state[index].posterPath,
                                          imageBuilder: (context, imageProvider) => Image(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                          placeholder: (context, url) => const SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: Center(child: CircularProgressIndicator()),
                                          ),
                                          errorWidget: (context, url, error) => const Icon(Icons.error),
                                          height: 180,
                                          width: 300,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  const Text(
                    'Upcoming',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: upComingController.obx(
                      (state) => ListView.builder(
                          key: const Key('uuu'),
                          scrollDirection: Axis.horizontal,
                          itemCount: state!.length,
                          itemBuilder: (context, index) {
                            return Hero(
                              tag: '${state[index].id}/upcoming',
                              child: SizedBox(
                                width: 180,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      final DetailsModel upComing = DetailsModel(
                                        key: '${state[index].id}/upcoming',
                                        image: AppUrl.imgUrl + state[index].backdropPath,
                                        title: state[index].originalTitle,
                                        description: state[index].overview,
                                        average: state[index].voteAverage,
                                      );
                                      Get.to(() => DetailsScreenView(details: upComing), arguments: index);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: CachedNetworkImage(
                                          imageUrl: AppUrl.imgUrl + state[index].posterPath,
                                          imageBuilder: (context, imageProvider) => Image(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                          placeholder: (context, url) => const SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: Center(child: CircularProgressIndicator()),
                                          ),
                                          errorWidget: (context, url, error) => const Icon(Icons.error),
                                          height: 180,
                                          width: 300,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
