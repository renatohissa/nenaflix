import UIKit
import Foundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView!
    var movies: [Movie] = []
    var currentPage = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.backgroundColor = .black
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: "MovieCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        
        fetchMovieData(page: 1)
        
    }
    
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
            let spacing: CGFloat = 5
            let screenWidth = view.bounds.width
            let itemWidth = (screenWidth - 3 * spacing) / 2
            layout.itemSize = CGSize(width: itemWidth, height: 400)
            layout.minimumInteritemSpacing = 5
            layout.minimumLineSpacing = -60
            layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
            return layout
    }
    
    func fetchMovieData(page: Int) {
        let apiKey = "50c2aab4d2dcc02fc766580060480a1e"
        let baseURL = "https://api.themoviedb.org/3"
        let endpoint = "/movie/popular"
        let urlString = "\(baseURL)\(endpoint)?api_key=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
                print("Invalid URL")
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error: \(error)")
                    return
                }
                
                guard let data = data else {
                    print("No data received")
                    return
                }
                do {
                            let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                            if let results = json["results"] as? [[String: Any]] {
                                for result in results {
                                    if let title = result["title"] as? String,
                                       let releaseDate = result["release_date"] as? String,
                                       let overview = result["overview"] as? String,
                                       let posterPath = result["poster_path"] as? String {
                                        let movie = Movie(title: title, releaseDate: releaseDate, overview: overview, posterPath: posterPath)
                                        self.movies.append(movie)
                                    }
                                }
                                DispatchQueue.main.async {
                                    self.collectionView.reloadData()
                                    self.currentPage = page
                                }
//                                DispatchQueue.main.async {
//                                    self.currentPage = page
                            }
                        } catch {
                            print("JSON Error: \(error)")
                        }
                    }
                    
                    task.resume()
                }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let movie = movies[indexPath.item]
        cell.configure(with: movie)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMovie = movies[indexPath.item]
        
        let movieDetailVC = MovieDetailViewController()
        movieDetailVC.movie = selectedMovie
        
        navigationController?.pushViewController(movieDetailVC, animated: true)
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.size.height {
            // Rolagem atingiu o final, carregue a próxima página
            fetchMovieData(page: currentPage + 1)
        
        }
    }
}

class MovieCell: UICollectionViewCell {
    var posterImageView: UIImageView!
    var titleLabel: UILabel!
    var releaseDateLabel: UILabel!
    var overviewLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        posterImageView = UIImageView()
        posterImageView.contentMode = .scaleAspectFill
        contentView.addSubview(posterImageView)
        
        titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        contentView.addSubview(titleLabel)
        
        releaseDateLabel = UILabel()
        releaseDateLabel.font = UIFont.systemFont(ofSize: 14)
        releaseDateLabel.textColor = .white
        releaseDateLabel.textAlignment = .center
        contentView.addSubview(releaseDateLabel)
        
        overviewLabel = UILabel()
        overviewLabel.font = UIFont.systemFont(ofSize: 14)
        overviewLabel.numberOfLines = 3
        overviewLabel.textColor = .white
        contentView.addSubview(overviewLabel)
        
        setupConstraints()

    }
    
    func setupConstraints() {
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
//        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            posterImageView.heightAnchor.constraint(equalToConstant: 250),
                    
            titleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: -60),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            releaseDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            releaseDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            releaseDateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            overviewLabel.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 4),
            overviewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            overviewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            overviewLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with movie: Movie) {
        titleLabel.text = movie.title
        releaseDateLabel.text = "Release Date: \(movie.releaseDate)"
        overviewLabel.text = movie.overview
        
        if let posterPath = movie.posterPath {
            let posterURL = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
            posterImageView.load(url: posterURL)
        }
    }
}

extension UIImageView {
    func load(url: URL?) {
        guard let url = url else { return }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
        }
    }
}
