//
//  Movie.swift
//  IOS_Project_2_Flixster
//
//  Created by Dylan Ignacio on 4/15/23.
//

import Foundation

struct Movie : Decodable {
    let overview: String
    let popularity: Double
    let poster_path: String
    let title: String
    let vote_average: Double
    let vote_count: Int
    let backdrop_path: String
}

struct MoviesResponse : Decodable {
    let results: [Movie]
}

//extension Movie {
//    static var mockMovies: [Movie] = [
//        Movie(overview:
//                "While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.",
//              popularity: 9032.947,
//              poster_path: URL(string: "https://image.tmdb.org/t/p/w185/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg")!,
//              title: "The Super Mario Bros. Movie",
//              vote_average: 7.5,
//              vote_count: 756,
//              backdrop_path: URL(string: "https://image.tmdb.org/t/p/w1280/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg")!),
//        Movie(overview:
//                "While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.",
//              popularity: 9032.947,
//              poster_path: URL(string: "https://image.tmdb.org/t/p/w185/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg")!,
//              title: "The Super Mario Bros. Movie",
//              vote_average: 7.5,
//              vote_count: 756,
//              backdrop_path: URL(string: "https://image.tmdb.org/t/p/w1280/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg")!),
//        Movie(overview:
//                "While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.",
//              popularity: 9032.947,
//              poster_path: URL(string: "https://image.tmdb.org/t/p/w185/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg")!,
//              title: "The Super Mario Bros. Movie",
//              vote_average: 7.5,
//              vote_count: 756,
//              backdrop_path: URL(string: "https://image.tmdb.org/t/p/w1280/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg")!),
//
//    ]
//}
