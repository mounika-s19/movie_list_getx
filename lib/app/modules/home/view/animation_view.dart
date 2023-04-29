import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_sample/app/components.dart/image_list_toprated.dart';
import 'package:getx_api_sample/app/components.dart/image_list_upcoming.dart';
import 'package:getx_api_sample/app/modules/home/controller/popular_controller.dart';
import 'package:getx_api_sample/app/modules/home/view/animation_detail_screen.dart';

import '../../../components.dart/fade_animation.dart';
import '../../../components.dart/image_list_popular.dart';
import '../../../data/movie_title.dart';
import '../../../routes/app_pages.dart';

class AnimationView extends StatelessWidget {
  const AnimationView({super.key});
  final double textOpacity = 1;
  final int duration = 1000;

  @override
  Widget build(BuildContext context) {
    PopularController popularController = Get.put(PopularController());
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: ShaderMask(
              blendMode: BlendMode.dstOut,
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.9),
                    Colors.black,
                  ],
                  stops: const [
                    0,
                    0.63,
                    0.69,
                    0.87,
                    1,
                  ],
                ).createShader(rect);
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AnimatedOpacity(
                      opacity: textOpacity,
                      duration: Duration(milliseconds: duration),
                      child: const FadeAnimation(
                        intervalStart: 0.1,
                        child: ImageListPopular(
                          startFrom: 0,
                          duration: 20,
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: textOpacity,
                      duration: Duration(microseconds: duration),
                      child: const FadeAnimation(
                        intervalStart: 0.2,
                        child: ImageListTopRated(
                          startFrom: 10,
                          duration: 30,
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: textOpacity,
                      duration: Duration(microseconds: duration),
                      child: const FadeAnimation(
                        intervalStart: 0.3,
                        child: ImageListPopular(
                          startFrom: 20,
                          duration: 30,
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: textOpacity,
                      duration: Duration(microseconds: duration),
                      child: const FadeAnimation(
                        intervalStart: 0.4,
                        child: ImageListUpComing(
                          startFrom: 30,
                          duration: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 24,
            right: 24,
            bottom: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedOpacity(
                      duration: Duration(milliseconds: duration),
                      opacity: textOpacity,
                      child: FadeAnimation(
                          intervalStart: 0.5,
                          child: Column(
                            children: const [
                              Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 30,
                              ),
                              SizedBox(height: 4),
                              Text(
                                'My List',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )),
                    ),
                    AnimatedOpacity(
                      duration: Duration(milliseconds: duration),
                      opacity: textOpacity,
                      child: FadeAnimation(
                        intervalStart: 0.6,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.red,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            minimumSize: const Size(110, 43),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.play_arrow,
                                color: Colors.black,
                                size: 25,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'PLAY',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      duration: Duration(milliseconds: duration),
                      opacity: textOpacity,
                      child: FadeAnimation(
                          intervalStart: 0.7,
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.home);
                            },
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.list,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'List',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                AnimatedOpacity(
                  duration: Duration(milliseconds: duration),
                  opacity: textOpacity,
                  child: const FadeAnimation(
                    intervalStart: 0.8,
                    child: Text(
                      'Previewing',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 110,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      String image = 'assets/${index + 1}.jpg';
                      return AnimatedOpacity(
                        duration: Duration(milliseconds: duration),
                        opacity: textOpacity,
                        child: FadeAnimation(
                          intervalStart: 0.9,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => AnimationDetailsScreen(
                                    image: image,
                                    title: movieTitle[index],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: 100.0,
                              height: 200.0,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(image),
                                ),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.redAccent,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
