//
//  MovieCell.swift
//  IOS_Project_2_Flixster
//
//  Created by Ana Alfaro-Garcia on 05/15/23.
//

import UIKit
import Nuke

class MovieCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    /// Configures the cell's UI for the given movie.
    func configure(with movie: Movie) {
        movieTitleLabel.text = movie.title
        overviewLabel.text = movie.overview
        
        // Load image async via Nuke library image loading helper method
        Nuke.loadImage(with: URL(string: "https://image.tmdb.org/t/p/w185"+movie.poster_path)!, into: movieImageView)
        
    }



}
