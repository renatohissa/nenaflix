//////
//////  APIRequest.swift
//////  Nenaflix
//////
//////  Created by Renato Pinheiro Hissa on 06/09/23.
//////
////
//import UIKit
//
//class APIResquest {
//
//
//
//    func fetchMovieData() {
//        let apiKey = "50c2aab4d2dcc02fc766580060480a1e"
//        let baseURL = "https://api.themoviedb.org/3"
//        let endpoint = "/movie/popular"
//        let urlString = "\(baseURL)\(endpoint)?api_key=\(apiKey)"
//
//        guard let url = URL(string: urlString) else {
//            print("Invalid URL")
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print("Error: \(error)")
//                return
//            }
//
//            guard let data = data else {
//                print("No data received")
//                return
//            }
//            do {
//                let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
//                if let results = json["results"] as? [[String: Any]] {
//                    for result in results {
//                        if let title = result["title"] as? String,
//                           let releaseDate = result["release_date"] as? String,
//                           let overview = result["overview"] as? String,
//                           let posterPath = result["poster_path"] as? String {
//                            let movie = Movie(title: title, releaseDate: releaseDate, overview: overview, posterPath: posterPath)
//                            self.movies.append(movie)
//                        }
//                    }
//                    DispatchQueue.main.async {
//                        self.collectionView.reloadData()
//                    }
//
//                }
//            } catch {
//                print("JSON Error: \(error)")
//            }
//        }
//
//        task.resume()
//        // para não bugar a repetiçao usando a tabbar
//        if UserDefaults.standard.dictionary(forKey: "favoriteMovies") == nil {
//            UserDefaults.standard.set([String: Bool](), forKey: "favoriteMovies")
//        }
//    }
//}
