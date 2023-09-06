import UIKit

class VideoCell: UITableViewCell {
    
    var titleLabel: UILabel!
    var releaseDate: UILabel!
    var overview: UILabel!
    var coverImageView: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLabel = UILabel()
        releaseDate = UILabel()
        overview = UILabel()
        coverImageView = UIImageView()
        
        contentView.addSubview(coverImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(releaseDate)
        contentView.addSubview(overview)
        
        contentView.backgroundColor = .black
        titleLabel.textColor = .white
        releaseDate.textColor = .white
        overview.textColor = .white
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: coverImageView.trailingAnchor, constant: 8).isActive = true
        
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        coverImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        coverImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        coverImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        coverImageView.widthAnchor.constraint(equalTo: contentView.heightAnchor, constant: -16).isActive = true
        
        releaseDate.translatesAutoresizingMaskIntoConstraints = false
        releaseDate.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
        releaseDate.leadingAnchor.constraint(equalTo: coverImageView.trailingAnchor, constant: 8).isActive = true
        
        overview.translatesAutoresizingMaskIntoConstraints = false
        overview.topAnchor.constraint(equalTo: releaseDate.bottomAnchor, constant: 4).isActive = true
        overview.leadingAnchor.constraint(equalTo: coverImageView.trailingAnchor, constant: 8).isActive = true
        overview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        overview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(video: Movie) {
        titleLabel.text = video.title
        releaseDate.text = "Release Date: \(video.releaseDate)"
        overview.text = video.overview
        
        if let posterPath = video.posterPath {
            let posterURL = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
            coverImageView.load(url: posterURL)
        }
    }
}
