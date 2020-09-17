class Movie {
  final double ratingScore;
  final int id,
      year,
      reviewerNumber,
      metaScoreRating,
      grossIncome,
      criticsReview;
  final String title, plot, backdrop, coverImage;
  final List<String> geners;
  final List<Map<String, String>> cast;

  Movie(
      {this.id,
      this.criticsReview,
      this.year,
      this.ratingScore,
      this.reviewerNumber,
      this.metaScoreRating,
      this.grossIncome,
      this.title,
      this.plot,
      this.backdrop,
      this.coverImage,
      this.geners,
      this.cast});
}

// our demo data movie data
List<Movie> movies = [
  Movie(
    id: 1,
    title: "Bloodshot",
    year: 2020,
    coverImage: "assets/images/backdrop_1.jpg",
    backdrop: "assets/images/backdrop_1.jpg",
    reviewerNumber: 150212,
    ratingScore: 7.3,
    criticsReview: 50,
    metaScoreRating: 76,
    geners: ["Action", "Drama"],
    plot: plotText,
    cast: [
      {
        "orginalName": "James Mangold",
        "movieName": "Director",
        "image": "assets/images/actor_1.png",
      },
      {
        "orginalName": "Matt Damon",
        "movieName": "Carroll",
        "image": "assets/images/actor_2.png",
      },
      {
        "orginalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "assets/images/actor_3.png",
      },
      {
        "orginalName": "Caitriona Balfe",
        "movieName": "Mollie",
        "image": "assets/images/actor_4.png",
      },
    ],
  ),
  Movie(
    id: 2,
    title: "Ford v Ferrari ",
    year: 2019,
    coverImage: "assets/images/backdrop_2.jpg",
    backdrop: "assets/images/backdrop_2.jpg",
    reviewerNumber: 150212,
    ratingScore: 8.2,
    criticsReview: 50,
    metaScoreRating: 76,
    geners: ["Action", "Biography", "Drama"],
    plot: plotText,
    cast: [
      {
        "orginalName": "James Mangold",
        "movieName": "Director",
        "image": "assets/images/actor_1.png",
      },
      {
        "orginalName": "Matt Damon",
        "movieName": "Carroll",
        "image": "assets/images/actor_2.png",
      },
      {
        "orginalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "assets/images/actor_3.png",
      },
      {
        "orginalName": "Caitriona Balfe",
        "movieName": "Mollie",
        "image": "assets/images/actor_4.png",
      },
    ],
  ),
  Movie(
    id: 1,
    title: "Onward",
    year: 2020,
    coverImage: "assets/images/backdrop_3.jpg",
    backdrop: "assets/images/backdrop_3.jpg",
    reviewerNumber: 150212,
    ratingScore: 7.6,
    criticsReview: 50,
    metaScoreRating: 79,
    geners: ["Action", "Drama"],
    plot: plotText,
    cast: [
      {
        "orginalName": "James Mangold",
        "movieName": "Director",
        "image": "assets/images/actor_1.png",
      },
      {
        "orginalName": "Matt Damon",
        "movieName": "Carroll",
        "image": "assets/images/actor_2.png",
      },
      {
        "orginalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "assets/images/actor_3.png",
      },
      {
        "orginalName": "Caitriona Balfe",
        "movieName": "Mollie",
        "image": "assets/images/actor_4.png",
      },
    ],
  ),
  Movie(
    id: 1,
    title: "Bloodshot",
    year: 2020,
    coverImage: "assets/images/backdrop_1.jpg",
    backdrop: "assets/images/backdrop_1.jpg",
    reviewerNumber: 150212,
    ratingScore: 7.3,
    criticsReview: 50,
    metaScoreRating: 76,
    geners: ["Action", "Drama"],
    plot: plotText,
    cast: [
      {
        "orginalName": "James Mangold",
        "movieName": "Director",
        "image": "assets/images/actor_1.png",
      },
      {
        "orginalName": "Matt Damon",
        "movieName": "Carroll",
        "image": "assets/images/actor_2.png",
      },
      {
        "orginalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "assets/images/actor_3.png",
      },
      {
        "orginalName": "Caitriona Balfe",
        "movieName": "Mollie",
        "image": "assets/images/actor_4.png",
      },
    ],
  ),
  Movie(
    id: 2,
    title: "Ford v Ferrari ",
    year: 2019,
    coverImage: "assets/images/backdrop_2.jpg",
    backdrop: "assets/images/backdrop_2.jpg",
    reviewerNumber: 150212,
    ratingScore: 8.2,
    criticsReview: 50,
    metaScoreRating: 76,
    geners: ["Action", "Biography", "Drama"],
    plot: plotText,
    cast: [
      {
        "orginalName": "James Mangold",
        "movieName": "Director",
        "image": "assets/images/actor_1.png",
      },
      {
        "orginalName": "Matt Damon",
        "movieName": "Carroll",
        "image": "assets/images/actor_2.png",
      },
      {
        "orginalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "assets/images/actor_3.png",
      },
      {
        "orginalName": "Caitriona Balfe",
        "movieName": "Mollie",
        "image": "assets/images/actor_4.png",
      },
    ],
  ),
  Movie(
    id: 1,
    title: "Onward",
    year: 2020,
    coverImage: "assets/images/backdrop_3.jpg",
    backdrop: "assets/images/backdrop_3.jpg",
    reviewerNumber: 150212,
    ratingScore: 7.6,
    criticsReview: 50,
    metaScoreRating: 79,
    geners: ["Action", "Drama"],
    plot: plotText,
    cast: [
      {
        "orginalName": "James Mangold",
        "movieName": "Director",
        "image": "assets/images/actor_1.png",
      },
      {
        "orginalName": "Matt Damon",
        "movieName": "Carroll",
        "image": "assets/images/actor_2.png",
      },
      {
        "orginalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "assets/images/actor_3.png",
      },
      {
        "orginalName": "Caitriona Balfe",
        "movieName": "Mollie",
        "image": "assets/images/actor_4.png",
      },
    ],
  ),
];

String plotText =
    "American car designer Carroll Shelby and driver Kn Miles battle corporate interference and the laws of physics to build a revolutionary race car for Ford in order.";
