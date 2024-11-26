//
//  DetailsViewController.swift
//  PodCastTask
//
//  Created by Ahmad on 26/11/2024.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var episodeCountLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    var item: PodCastSectionContent?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        guard let item = item else { return }
        
        if let urlString = item.avatar_url, let url = URL(string: urlString) {
            avatarImageView.load(url: url)
        } else {
            avatarImageView.backgroundColor = .gray
        }
        
        nameLabel.text = item.name
        descriptionLabel.text = item.description
        durationLabel.text = DateFormatter.formatDuration(item.duration ?? 0)
        
        if let episodeCount = item.episodeCount {
            episodeCountLabel.text = "\(episodeCount) episodes"
            episodeCountLabel.isHidden = false
        } else {
            episodeCountLabel.isHidden = true
        }
        
        if let releaseDate = item.releaseDate {
            releaseDateLabel.text = "Released: \(DateFormatter.formatDate(releaseDate) ?? "")"
        }
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url),
               let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = image
                    self.contentMode = .scaleAspectFill
                }
            }
        }
    }
}
