import 'package:flutter/material.dart';
import 'package:holiday_trip_app_interface/utils/button_style_constant.dart';
import 'package:holiday_trip_app_interface/utils/color_constant.dart';
import 'package:holiday_trip_app_interface/utils/dummy_data.dart';
import 'package:holiday_trip_app_interface/utils/text_styles_constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstant.mainColor,
          title: Text(
            'Holiday Trip',
            style: TextStylesConstant.logoTextStyle(
                color: ColorConstant.whiteTextColor),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 8.0,
                            right: 4.0,
                            top: 16.0,
                            bottom: 8.0,
                          ),
                          child: Icon(
                            Icons.percent,
                            color: ColorConstant.mainColor,
                          ),
                        ),
                        Text(
                          "Special Trip",
                          style: TextStylesConstant.titleTextStyle(),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "View all",
                      style: TextStylesConstant.buttonTextStyle(
                          color: ColorConstant.mainColor, fontsize: 12.0),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 160,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 8.0),
                      child: Card(
                        color: ColorConstant.whiteFieldColor,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: Image.network(
                                  DummyData.imageDummy[index],
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 24.0,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Beach Villa",
                                    style: TextStylesConstant.normalTextStyle(),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      "Hawai,USA",
                                      style:
                                          TextStylesConstant.detailTextSTyle(),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Text(
                                          "Rp 240.000",
                                          style: TextStylesConstant
                                              .detailTextSTyle(
                                                  fontweight:
                                                      FontWeight.normal),
                                        ),
                                      ),
                                      Text(
                                        "Rp 300.000",
                                        style: TextStylesConstant
                                            .lineThroughTextStyle(),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: DummyData.imageDummy.length,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  color: ColorConstant.accentColor,
                  height: 180,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Didn't have any trip plans yet?",
                          style: TextStylesConstant.titleTextStyle(
                              color: ColorConstant.whiteTextColor),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "Try to find it while browse our plane & accommodation now.",
                            style: TextStylesConstant.detailTextSTyle(
                                color: ColorConstant.whiteTextColor),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: ElevatedButton(
                                onPressed: () {},
                                style:
                                    ButtonStyleConstant.elevatedButtonStyle(),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 4.0),
                                      child: Icon(
                                        Icons.airplanemode_active,
                                        color: ColorConstant.whiteTextColor,
                                      ),
                                    ),
                                    Text(
                                      "Plane",
                                      style:
                                          TextStylesConstant.buttonTextStyle(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyleConstant.elevatedButtonStyle(),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 4.0),
                                    child: Icon(
                                      Icons.hotel,
                                      color: ColorConstant.whiteTextColor,
                                    ),
                                  ),
                                  Text(
                                    "Accom",
                                    style: TextStylesConstant.buttonTextStyle(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 16.0,
                      bottom: 8.0,
                      left: 8.0,
                      right: 4.0,
                    ),
                    child: Icon(
                      Icons.thumb_up,
                      color: ColorConstant.mainColor,
                    ),
                  ),
                  Text(
                    "Top rated accomodation",
                    style: TextStylesConstant.titleTextStyle(),
                  )
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Card(
                      color: ColorConstant.whiteFieldColor,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.network(
                                DummyData.imageDummy[index],
                                width: 120,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Beach Villa",
                                style: TextStylesConstant.normalTextStyle(),
                              ),
                              Text(
                                "Hawai, USA",
                                style: TextStylesConstant.detailTextSTyle(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.favorite,
                                      color: ColorConstant.mainColor,
                                      size: 14,
                                    ),
                                    Text(
                                      " 3,400",
                                      style: TextStylesConstant.detailTextSTyle(
                                          fontweight: FontWeight.normal),
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                "Rp. 380.000",
                                style: TextStylesConstant.normalTextStyle(
                                    fontsize: 14),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                childCount: DummyData.imageDummy.length,
              ),
            ),
          ],
        ));
  }
}
