//
//  DetailViewController.swift
//  IOS_Project_2_Flixster
//
//  Created by Ana Alfaro-Garcia on 05/15/23.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {

    @IBOutlet weak var backdropImageView: UIImageView!
    var movie: Movie!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var averageVoteLabel: UILabel!
    @IBOutlet weak var votesLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            Nuke.loadImage(with: URL(string: "https://image.tmdb.org/t/p/w1280"+movie.backdrop_path)!, into: backdropImageView)
            movieTitleLabel.text = movie.title
            averageVoteLabel.text = String(movie.vote_average) + " Vote Average"
            votesLabel.text = String(movie.popularity) + " Votes"
            popularityLabel.text = String(movie.popularity) + " Popularity"
            overviewLabel.text = movie.overview
        }
}
