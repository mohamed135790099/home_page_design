import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light, // status bar color
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Home Page Desgin',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
   const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    //772458
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
        children: [
          appBarWidget(),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                    padding:const EdgeInsets.symmetric(vertical:10),
                    child: CarouselWithItems()
                ),
                SizedBox(
                    height:100,
                    width:MediaQuery.of(context).size.width,
                    child: CustomListViewServices()
                ),
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 24,vertical:16),
                  child: CustomTitleAppointmentWidget(title:"Upcoming appointment",),
                ),
                SizedBox(
                    height:150,
                    child: DoctorCardListView()
                ),
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 24,vertical:16),
                  child: CustomTitleAppointmentWidget(title:" Features Offers",),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20,vertical:16),
                  child: FeaturedListView(),
                ),
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 24,vertical:16),
                  child: CustomTitleAppointmentWidget(title:"Our Doctors",),
                ),
                SizedBox(
                    height:170,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20,vertical:16),
                      child: ListFromDectorWidget(),
                    )
                ),
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 24,vertical:16),
                  child: CustomTitleAppointmentWidget(title:"Our Services",),
                ),
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 24,vertical:16),
                  child: OurServicesListView(),
                ),
              ],
            ),
          )
             
        ],
        ),
      ),
      bottomNavigationBar:CustomNavBarWithCircle(),
    );
  }

  Widget appBarWidget(){
    return Container(
      width:MediaQuery.of(context).size.width,
      height: 185,
      decoration: const ShapeDecoration(
        color: Color(0xFF772457),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
      child:Padding(
        padding: const EdgeInsets.symmetric(horizontal:24, vertical:16),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            const SizedBox(height:30,),
            SizedBox(
              width:MediaQuery.of(context).size.width,
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Hey, Dallia',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Open Runde',
                              fontWeight: FontWeight.w700,
                              height: 1.25,
                              letterSpacing: -0.30,
                            ),
                          ),
                          SizedBox(width: 8),
                        ],
                      ),
                      Text(
                        'Let’s start our beauty journey',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Open Runde',
                          fontWeight: FontWeight.w400,
                          height: 1.67,
                          letterSpacing: -0.30,
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Icon(
                          Icons.notifications,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      Positioned(
                        top: 4,
                        right: 4,
                        child: Container(
                          width: 13,
                          height: 13,
                          decoration: const BoxDecoration(
                            color: Color(0xFF3EFF1E),
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Text(
                              '3',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:20),
              child: Container(
                width: 382,
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: ShapeDecoration(
                  color: const Color(0xFFF7F7F7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textEditingController,
                        decoration: const InputDecoration(
                          hintText: 'Search your favorite services',
                          hintStyle: TextStyle(
                            color: Color(0xFF9B9B9B),
                            fontSize: 10,
                            fontFamily: 'Open Runde',
                            fontWeight: FontWeight.w400,
                            height: 2.36,
                            letterSpacing: -0.30,
                          ),
                          border: InputBorder.none,
                          prefixIcon:Icon(Icons.search,color:Colors.grey,)
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Open Runde',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CarouselWithItems extends StatefulWidget {
  @override
  State<CarouselWithItems> createState() => _CarouselWithItemsState();
}

class _CarouselWithItemsState extends State<CarouselWithItems> {
  int currentIndex =0;

  final List<Map<String, String>> items = [
    {
      "image": "https://plus.unsplash.com/premium_photo-1658506671316-0b293df7c72b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", // Replace with your image URL
      "title": "50% off Cold peeling",
      "description": "Cold peeling sessions for one month",
    },
    {
      "image": "https://plus.unsplash.com/premium_photo-1658506671316-0b293df7c72b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", // Replace with your image URL
      "title": "30% off Cold peeling",
      "description": "Facial treatments for glowing skin",
    },
    {
      "image": "https://plus.unsplash.com/premium_photo-1658506671316-0b293df7c72b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", // Replace with your image URL
      "title": "20% off Cold peeling",
      "description": "Hydration therapy sessions",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: CarouselIndicator(itemCount:items.length,currentIndex:  currentIndex),
        ),

        CarouselSlider(
          options: CarouselOptions(
            height: 200,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            aspectRatio: 16 / 9,
            initialPage: 0,
            onPageChanged: (index, reason) {
              // Update the current index when the page changes
              setState(() {
                currentIndex = index;
              });
            },
          ),
          items: items.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.black.withOpacity(0.5),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x19772458),
                        blurRadius: 5,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          Stack(
                          children:[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                item['image']!,
                                width: MediaQuery.of(context).size.width,
                                height:200,
                                fit: BoxFit.cover,
                              ),
                            ),
                           Positioned(
                             top:100,
                             right:30,
                             child: Column(
                             children: [
                               Text('${item['title']} ',
                              style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Open Runde',
                              fontWeight: FontWeight.w700,
                              height: 1.25,
                              letterSpacing: -0.30,
                              ),
                             ),
                               Text(
                                '${item['description']}',
                                 style: const TextStyle(
                                   color: Colors.white,
                                   fontSize: 14,
                                   fontFamily: 'Open Runde',
                                   fontWeight: FontWeight.w600,
                                   height: 1.43,
                                   letterSpacing: -0.30,
                                 ),
                               ),
                             ],
                             )
                             ),

                         ]
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}

class CarouselIndicator extends StatelessWidget {
  final int itemCount; // Total number of items in the carousel
  final int currentIndex; // Index of the currently active item

  const CarouselIndicator({
    super.key,
    required this.itemCount,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(itemCount, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Container(
              width: 8,
              height: 8,
              decoration: ShapeDecoration(
                color: index == currentIndex
                    ? const Color(0xFF7B2B5D) // Active indicator color
                    : const Color(0xFFD9D9D9), // Inactive indicator color
                shape: const OvalBorder(),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class CustomListViewServices extends StatelessWidget {
  final List<Map<String, String>> items = [
    {"image": "https://plus.unsplash.com/premium_photo-1658506671316-0b293df7c72b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", "text": "Trichologist"},
    {"image": "https://plus.unsplash.com/premium_photo-1658506671316-0b293df7c72b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", "text": "Reconstruction"},
    {"image": "https://plus.unsplash.com/premium_photo-1658506671316-0b293df7c72b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", "text": "Cosmetology"},
    {"image": "https://plus.unsplash.com/premium_photo-1658506671316-0b293df7c72b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", "text": "Gynecological"},
    {"image": "https://plus.unsplash.com/premium_photo-1658506671316-0b293df7c72b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", "text": "Trichologist"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      itemBuilder: (context, index) {
        final item = items[index];
        return Padding(
          padding: const EdgeInsets.only(right: 12.0), // Add spacing between items
          child: SizedBox(
            width: 64, // Fixed width for each item
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage(item["image"]!),
                      fit: BoxFit.fill,
                    ),
                    shape: const OvalBorder(),
                  ),
                ),
                const SizedBox(height: 4),
                SizedBox(
                  width: 52,
                  child: Text(
                    item["text"]!,
                    style: const TextStyle(
                      color: Color(0xFFBCBCBC),
                      fontSize: 10,
                      fontFamily: 'Open Runde',
                      fontWeight: FontWeight.w400,
                      height: 2.36,
                      overflow:TextOverflow.ellipsis,
                      letterSpacing: -0.30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomTitleAppointmentWidget extends StatelessWidget {
  String title;
  CustomTitleAppointmentWidget({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      width:MediaQuery.of(context).size.width,
      height: 24,
      child:  Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF772457),
              fontSize: 18,
              fontFamily: 'Open Runde',
              fontWeight: FontWeight.w600,
              height: 1.31,
              letterSpacing: -0.30,
            ),
          ),
          const SizedBox(width: 16),
          const Text(
            'See all',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFBCBCBC),
              fontSize: 12,
              fontFamily: 'Open Runde',
              fontWeight: FontWeight.w400,
              height: 1.97,
              letterSpacing: -0.30,
            ),
          ),
        ],
      ),
    );
  }
}

class DoctorCardListView extends StatelessWidget {
  final List<Map<String, dynamic>> doctors = [
    {
      "name": "Dr Eman Sanad",
      "speciality": "Dermatology and Laser Surgery",
      "image": "https://plus.unsplash.com/premium_photo-1658506671316-0b293df7c72b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "status": "UPCOMING",
      "time": "07:00 - 07:30 pm",
      "date": "Today",
    },
    {
      "name": "Dr John Doe",
      "speciality": "Cardiology Specialist",
      "image": "https://plus.unsplash.com/premium_photo-1658506671316-0b293df7c72b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "status": "COMPLETED",
      "time": "08:00 - 08:30 pm",
      "date": "Yesterday",
    },
    {
      "name": "Dr Jane Smith",
      "speciality": "Pediatrics",
      "image": "https://plus.unsplash.com/premium_photo-1658506671316-0b293df7c72b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "status": "UPCOMING",
      "time": "09:00 - 09:30 am",
      "date": "Tomorrow",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0), // Add horizontal padding
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: doctors.length, // Adjusted to show actual doctors
        itemBuilder: (context, index) {
          var doctor = doctors[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0), // Padding between each item
            child: Container(
              width: 320, // Fixed width for each doctor card
              height: 127,
              padding:const EdgeInsets.symmetric(horizontal: 10),
              decoration: ShapeDecoration(
                color: const Color(0xFF772457),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity, // Take the available width
                    height: 61,
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: NetworkImage(doctor['image']),
                              fit: BoxFit.fill,
                            ),
                            shape: const OvalBorder(
                              side: BorderSide(
                                width: 1,
                                color: Color(0xFF41151B),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              doctor['name'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: 100, // Adjust the width
                              height: 20,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: List.generate(5, (index) {
                                  return Icon(
                                    Icons.star,
                                    color: index < 4 ? Colors.yellow : Colors.grey,
                                    size: 16,
                                  );
                                }),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              doctor['speciality'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          doctor['status'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 7.5,
                            fontWeight: FontWeight.w700,
                            height: 3.15,
                            letterSpacing: -0.30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color:Colors.white,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: 336,
                    height: 23,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.date_range,size:15,color:Colors.white,),
                            const SizedBox(width:10,),
                            Text(
                              doctor['date'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.access_time_sharp,size:15,color:Colors.white,),
                            const SizedBox(width:10,),
                            Text(
                              doctor['time'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
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


class FeaturedListView extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      "image": "https://plus.unsplash.com/premium_photo-1658506671316-0b293df7c72b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "title": "Featured",
      "service": "PRP session",
      "price": "800 EGP/per session",
      "rating": "4.5",
      "availability": "07",
    },
    {
      "image": "https://plus.unsplash.com/premium_photo-1658506671316-0b293df7c72b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "title": "Featured",
      "service": "Laser Treatment",
      "price": "1000 EGP/per session",
      "rating": "4.2",
      "availability": "05",
    },
    {
      "image": "https://plus.unsplash.com/premium_photo-1658506671316-0b293df7c72b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "title": "Featured",
      "service": "Facial Therapy",
      "price": "600 EGP/per session",
      "rating": "4.8",
      "availability": "10",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 228,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: 170,
              height: 228,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage(item['image']),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 12),
                  Container(
                    width: 170,
                    height: 75,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.75),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          item['service'],
                          style: const TextStyle(
                            color: Color(0xFF772457),
                            fontSize: 16,
                            fontFamily: 'Open Runde',
                            fontWeight: FontWeight.w600,
                            height: 1.48,
                            letterSpacing: -0.30,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item['price'],
                          style: const TextStyle(
                            color: Color(0xFF41151B),
                            fontSize: 10,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  item['availability'],
                                  style:const TextStyle(
                                    color: Color(0xFF41151B),
                                    fontSize: 8,
                                    fontFamily: 'Open Runde',
                                    fontWeight: FontWeight.w400,
                                    height: 2.95,
                                    letterSpacing: -0.30,
                                  ),
                                ),
                                const SizedBox(width:2),
                                const Icon(Icons.person,color:Colors.grey,size:10,)

                              ],
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'l',
                              style: TextStyle(
                                color: Color(0xFF41151B),
                                fontSize: 8,
                                fontFamily: 'Open Runde',
                                fontWeight: FontWeight.w400,
                                height: 2.95,
                                letterSpacing: -0.30,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Row(
                              children: [
                                Text(
                                  item['rating'],
                                  style: const TextStyle(
                                    color: Color(0xFF41151B),
                                    fontSize: 8,
                                    fontFamily: 'Open Runde',
                                    fontWeight: FontWeight.w400,
                                    height: 2.95,
                                    letterSpacing: -0.30,
                                  ),
                                ),
                                const SizedBox(width:2),
                                const Icon(Icons.star,color:Colors.amberAccent,size:10,)
                              ],
                            ),
                          ],
                        ),
                      ],
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


class ListFromDectorWidget extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      "image": "https://plus.unsplash.com/premium_photo-1658506671316-0b293df7c72b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "name": "Dr Manal Ali",
      "specialty": "Dermatology",
      "rating": "4.5",
    },
    {
      "image": "https://plus.unsplash.com/premium_photo-1658506671316-0b293df7c72b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "name": "Dr Ahmed Ali",
      "specialty": "Cardiology",
      "rating": "4.2",
    },
    {
      "image": "https://plus.unsplash.com/premium_photo-1658506671316-0b293df7c72b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "name": "Dr Sara Ahmed",
      "specialty": "Neurology",
      "rating": "4.8",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 127,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              width: 125,
              height: 127,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Rating section (top of the container)
                  Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 90,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: NetworkImage(item['image']),
                            fit: BoxFit.contain,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      Positioned(
                          top:10,
                          left:5,
                          child:Row(
                            children: [
                              Text(
                                item['rating'],
                                style: const TextStyle(
                                  color: Color(0xFF41151B),
                                  fontSize: 10,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(width:3,),
                              const Icon(Icons.star,color:Colors.amberAccent,size:10,)
                            ],
                          ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Name and specialty section
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        item['name'],
                        style:const TextStyle(
                          color: Color(0xFF41151B),
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        item['specialty'],
                        style: const TextStyle(
                          color: Color(0xFFBCBCBC),
                          fontSize: 10,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
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

class OurServicesListView extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      "image": "https://plus.unsplash.com/premium_photo-1658506671316-0b293df7c72b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "title": "Cold peeling",
      "rating": "4.5",
      "value": "07",
    },
    {
      "image": "https://plus.unsplash.com/premium_photo-1658506671316-0b293df7c72b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "title": "Facial Treatment",
      "rating": "4.2",
      "value": "10",
    },
    {
      "image": "https://plus.unsplash.com/premium_photo-1658506671316-0b293df7c72b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "title": "Skin Care",
      "rating": "4.8",
      "value": "14",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: 164,
              height: 210,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage(item['image']),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Overlay container with title, value, rating, and booking button
                  Container(
                    width: 164,
                    height: 102,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.75),
                      shape:const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                          child: Text(
                            item['title'],
                            style:const TextStyle(
                              color: Color(0xFF41151B),
                              fontSize: 14,
                              fontFamily: 'Open Runde',
                              fontWeight: FontWeight.w600,
                              height: 1.69,
                              letterSpacing: -0.30,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  item['value'],
                                  style:const TextStyle(
                                    color: Color(0xFF41151B),
                                    fontSize: 8,
                                    fontFamily: 'Open Runde',
                                    fontWeight: FontWeight.w400,
                                    height: 2.95,
                                    letterSpacing: -0.30,
                                  ),
                                ),
                                const SizedBox(width:2),
                                const Icon(Icons.person,color:Colors.grey,size:10,)

                              ],
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'l',
                              style: TextStyle(
                                color: Color(0xFF41151B),
                                fontSize: 8,
                                fontFamily: 'Open Runde',
                                fontWeight: FontWeight.w400,
                                height: 2.95,
                                letterSpacing: -0.30,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Row(
                              children: [
                                Text(
                                  item['rating'],
                                  style: const TextStyle(
                                    color: Color(0xFF41151B),
                                    fontSize: 8,
                                    fontFamily: 'Open Runde',
                                    fontWeight: FontWeight.w400,
                                    height: 2.95,
                                    letterSpacing: -0.30,
                                  ),
                                ),
                                const SizedBox(width:2),
                                const Icon(Icons.star,color:Colors.amberAccent,size:10,)
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        ElevatedButton(
                          onPressed: () {
                            // Add your button action here
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize:const Size(113, 24),
                            backgroundColor: const Color(0xFF772457), // Background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15), // Border radius
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Booking',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Icon(Icons.arrow_forward_ios_rounded,color:Colors.white,size:15,)
                            ],
                          ),
                        )

                      ],
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



class CustomNavBarWithCircle extends StatefulWidget {
  @override
  _CustomNavBarWithCircleState createState() => _CustomNavBarWithCircleState();
}

class _CustomNavBarWithCircleState extends State<CustomNavBarWithCircle> {
  int _selectedIndex = 2; // Default selected index (e.g., Home)

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:100,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(5, (index) {
                  final isSelected = index == _selectedIndex;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (!isSelected) Icon(_getIcon(index), color: Color(0xFF772457), size: 25),
                        if (!isSelected)
                          Text(
                            _getLabel(index),
                            style: const TextStyle(
                              color: Color(0xFF772457),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
          Positioned(
            bottom: 35, // Adjust circle position
            left: _getCirclePosition(_selectedIndex, context),
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: const Color(0xFF772457),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 4),
              ),
              child: Icon(
                _getIcon(_selectedIndex),
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Dynamically calculates the circle position based on the selected index
  double _getCirclePosition(int index, BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double itemWidth = screenWidth / 5; // 5 navigation items
    return itemWidth * index + (itemWidth / 2) - 30; // Center the circle
  }

  // Returns the icon for the navigation item
  IconData _getIcon(int index) {
    switch (index) {
      case 0:
        return Icons.person;
      case 1:
        return Icons.calendar_today;
      case 2:
        return Icons.home;
      case 3:
        return Icons.description;
      case 4:
        return Icons.settings;
      default:
        return Icons.home;
    }
  }

  // Returns the label for each navigation item
  String _getLabel(int index) {
    switch (index) {
      case 0:
        return 'Doctors';
      case 1:
        return 'Appointments';
      case 2:
        return 'Home';
      case 3:
        return 'Medical Profile';
      case 4:
        return 'Settings';
      default:
        return '';
    }
  }
}






