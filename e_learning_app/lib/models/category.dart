class Category {
  final String name, imagePath;
  final int numberOfCourses;

  Category(
    this.name,
    this.imagePath,
    this.numberOfCourses,
  );
}

var cateforiesData = [
  {
    'name': 'music',
    'numberOfCourses': 15,
    'imagePath': 'assets/images/ux_big.png',
  },
  {
    'name': 'business',
    'numberOfCourses': 12,
    'imagePath': 'assets/images/business.png',
  },
  {
    'name': 'marketing',
    'numberOfCourses': 15,
    'imagePath': 'assets/images/marketing.png',
  },
  {
    'name': 'photography',
    'numberOfCourses': 12,
    'imagePath': 'assets/images/photography.png',
  },
  {
    'name': 'ux-design',
    'numberOfCourses': 15,
    'imagePath': 'assets/images/ux_design.png',
  },
];

List<Category> categories = cateforiesData
    .map(
      (item) => Category(
        item['name'],
        item['imagePath'],
        item['numberOfCourses'],
      ),
    )
    .toList();
