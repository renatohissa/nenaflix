////
////  APIController.swift
////  Nenaflix
////
////  Created by Renato Pinheiro Hissa on 15/08/23.
////
//
//import Foundation
//
//
//func fetchMovieData() {
//    // Construir a URL da API
//    let apiKey = "50c2aab4d2dcc02fc766580060480a1e"
//    let baseURL = "https://api.themoviedb.org/3"
//    let endpoint = "/movie/popular"
//    let urlString = "\(baseURL)\(endpoint)?api_key=\(apiKey)"
//
//    // Criar a URL
//    if let url = URL(string: urlString) {
//        // Fazer a solicitação HTTP
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print("Error: \(error)")
//                return
//            }
//
//            // Processar a resposta JSON
//            if let data = data {
//                do {
//                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
//                        if let results = json["results"] as? [[String: Any]] {
//                            for movie in results {
//                                if let title = movie["title"] as? String,
//                                   let releaseDate = movie["release_date"] as? String,
//                                   let overview = movie["overview"] as? String {
//                                    print("Title: \(title)")
//                                    print("Release Date: \(releaseDate)")
//                                    print("Overview: \(overview)\n")
//                                }
//                            }
//                        }
//                    }
//                } catch {
//                    print("JSON Error: \(error)")
//                }
//            }
//        }
//
//        task.resume()
//    } else {
//        print("Invalid URL")
//    }
//}  // Manter o aplicativo rodando para aguardar a conclusão da tarefa
