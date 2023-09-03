////
////  FavoriteMovieCell.swift
////  Nenaflix
////
////  Created by Renato Pinheiro Hissa on 21/08/23.
////
//
//import UIKit
//
//class FavoriteMovieCell: UITableViewCell {
//
//    var movieImageView: UIImageView!
//    var titleLabel: UILabel!
//    var descriptionLabel: UILabel!
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//        setupUI()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func setupUI() {
//        // Configure os elementos da célula e as constraints aqui
////    }
//
//    func configure(with movie: Movie) {
//        // Configure a célula com os detalhes do filme
//        titleLabel.text = movie.title
//        descriptionLabel.text = movie.overview // Use a propriedade overview para a descrição
//
//        if let posterPath = movie.posterPath {
//            let posterURL = URL(string: "https://image.tmdb.org/t/p/w200\(posterPath)")
//            movieImageView.load(url: posterURL)
//        }
//    }
//}
