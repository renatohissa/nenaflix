
import UIKit

class FavoriteMovieViewController: FeedMovieViewController {

    let tableView = UITableView()
    var videos: [Movie] = []

    struct Cells {
        static let videoCell = "VideoCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favorites"
        configureTableView()
        tableView.backgroundColor = .black
        tableView.separatorColor = .white
        tableView.separatorStyle = .singleLine
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Recarregue os filmes favoritos sempre que a visualização for apresentada
        videos = getFavoriteMovies()
        tableView.reloadData()
    }

    func configureTableView() {
        view.addSubview(tableView)
        tableView.rowHeight = 120
        tableView.register(VideoCell.self, forCellReuseIdentifier: Cells.videoCell)
        
        tableView.pin(to: view)
        setTableViewDelegate()
        
        // Carregar os dados dos filmes favoritos do UserDefaults
        if let favoriteMoviesDict = UserDefaults.standard.dictionary(forKey: "favoriteMovies") as? [String: Bool] {
            // Filtrar os filmes favoritos com base no dicionário
            videos = movies.filter { (movie) -> Bool in
                return favoriteMoviesDict[movie.title] ?? false
            }
        }
    }

    func setTableViewDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension FavoriteMovieViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.videoCell, for: indexPath) as! VideoCell
        let video = videos[indexPath.row]
        cell.set(video: video)

        return cell
    }
}
