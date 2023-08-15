import UIKit
import Foundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView!
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.backgroundColor = .white
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: "MovieCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        
        fetchMovieData()
    }
    
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 150)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        return layout
    }
    
    func fetchMovieData() {
        let apiKey = "50c2aab4d2dcc02fc766580060480a1e"
        let baseURL = "https://api.themoviedb.org/3"
        let endpoint = "/movie/popular"
        let urlString = "\(baseURL)\(endpoint)?api_key=\(apiKey)"
        
        // Criar a URL
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
                                }
                            }
                        } catch {
                            print("JSON Error: \(error)")
                        }
                    }
                    
                    task.resume()
                }
    
    // UICollectionViewDataSource methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let movie = movies[indexPath.item]
        cell.configure(with: movie)
        return cell
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
        posterImageView.contentMode = .scaleAspectFit
        contentView.addSubview(posterImageView)
        
        titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        contentView.addSubview(titleLabel)
        
        releaseDateLabel = UILabel()
        releaseDateLabel.font = UIFont.systemFont(ofSize: 14)
        contentView.addSubview(releaseDateLabel)
        
        overviewLabel = UILabel()
        overviewLabel.font = UIFont.systemFont(ofSize: 14)
        overviewLabel.numberOfLines = 3
        contentView.addSubview(overviewLabel)
        
        // Set up constraints
        setupConstraints()
    }
    
    func setupConstraints() {
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            posterImageView.heightAnchor.constraint(equalToConstant: 100), // Adjust the height as needed
            
            titleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 4),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
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
