import 'package:flutter_application_1/models/education_model.dart';

List videoLink = [
  "https://cdn.cms.medianova.com/p/132/sp/13200/serveFlavor/entryId/0_402pg2wr/v/2/ev/10/flavorId/0_jpibng14/forceproxy/true/name/a.mp4",
  "https://cdn.cms.medianova.com/p/132/sp/13200/serveFlavor/entryId/0_1d1xnbrn/v/2/ev/10/flavorId/0_ccav4sj4/forceproxy/true/name/a.mp4",
  "https://cdn.cms.medianova.com/p/132/sp/13200/serveFlavor/entryId/0_yiu6meor/v/2/ev/10/flavorId/0_t84jbjzz/forceproxy/true/name/a.mp4"
];

List<Education> dummyEducations = [
  Education(
    id: "1",
    image: "lib/assets/eduBanner.png",
    title: "Flutter Education",
    teacher: "Halit Enes Kalaycı",
    progress: 100,
    startDate: DateTime.now(),
    endDate: DateTime.now(),
    spentTime: const Duration(days: 1),
    estimatedTime: const Duration(days: 1),
    category: "Category",
    videoCount: 3,
    videoList: List.generate(
      3,
      (index) => Video(
        id: index + 1,
        videoTitle: "Flutter Video ${index + 1}",
        link: videoLink[index], // "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
        duration: Duration(minutes: (index + 1) * 10),
        status: index == 0
            ? "Completed"
            : (index == 1
                ? "In Progress"
                : "Not Started"), // İlk video tamamlandı, ikinci video devam ediyor, diğerleri başlamadı
      ),
    ),
  ),
  Education(
    id: "2",
    image: "lib/assets/eduBanner.png",
    title: "Dart Education",
    teacher: "John Doe",
    progress: 50,
    startDate: DateTime.now(),
    endDate: DateTime.now(),
    spentTime: const Duration(days: 1),
    estimatedTime: const Duration(days: 1),
    category: "Category",
    videoCount: 3,
    videoList: List.generate(
      3,
      (index) => Video(
        id: index + 1,
        videoTitle: "Dart Video ${index + 1}",
        link: videoLink[index],
        duration: Duration(minutes: (index + 1) * 15),
        status: index == 0 ? "Completed" : "Not Started", // İlk video tamamlandı, diğerleri başlamadı
      ),
    ),
  ),
  Education(
    id: "3",
    image: "lib/assets/eduBanner.png",
    title: "Firebase Education",
    teacher: "Jane Smith",
    progress: 25,
    startDate: DateTime.now(),
    endDate: DateTime.now(),
    spentTime: const Duration(days: 1),
    estimatedTime: const Duration(days: 1),
    category: "Category",
    videoCount: 3,
    videoList: List.generate(
      3,
      (index) => Video(
        id: index + 1,
        videoTitle: "Firebase Video ${index + 1}",
        link: videoLink[index],
        duration: Duration(minutes: (index + 1) * 20),
        status: index == 0
            ? "Completed"
            : (index == 2
                ? "In Progress"
                : "Not Started"), // İlk video tamamlandı, üçüncü video devam ediyor, diğerleri başlamadı
      ),
    ),
  ),
  Education(
    id: "4",
    image: "lib/assets/eduBanner.png",
    title: "SQL Education",
    teacher: "Michael Johnson",
    progress: 0,
    startDate: DateTime.now(),
    endDate: DateTime.now(),
    spentTime: const Duration(days: 0),
    estimatedTime: const Duration(days: 1),
    category: "Category",
    videoCount: 3,
    videoList: List.generate(
      3,
      (index) => Video(
        id: index + 1,
        videoTitle: "SQL Video ${index + 1}",
        link: videoLink[index],
        duration: Duration(minutes: (index + 1) * 25),
        status: index == 0 ? "Completed" : "Not Started", // İlk video tamamlandı, diğerleri başlamadı
      ),
    ),
  ),
];
