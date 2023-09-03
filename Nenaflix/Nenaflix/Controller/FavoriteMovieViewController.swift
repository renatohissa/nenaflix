
import UIKit

class FavoriteMovieViewController: ViewController {
    
    let tableView = UITableView()
    var videos: [Movie] = []
    
    struct Cells {
        static let videoCell = "VideoCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favorites"
        videos = movies
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.rowHeight = 120
        tableView.register(MovieCell.self, forCellReuseIdentifier: Cells.videoCell)
        
        tableView.pin(to: view)
        setTableViewDelegate()
    }
    
    func setTableViewDelegate() {
            tableView.delegate = self
            tableView.dataSource = self
        }
    
}

extension FavoriteMovieViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.videoCell) as! VideoCell
        let video = videos[indexPath.row]
        cell.set(video: video)
        
        return cell
    }
}
