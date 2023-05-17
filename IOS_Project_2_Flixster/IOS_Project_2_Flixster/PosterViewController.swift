//
//  PosterViewController.swift
//  IOS_Project_2_Flixster
//
//  Created by Ana Alfaro-Garcia on 05/15/23.
//

import UIKit
import Nuke

class PosterViewController: UIViewController, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell

        let movie = movies[indexPath.item]

        let imageUrl = URL(string: "https://image.tmdb.org/t/p/w342"+movie.poster_path)!

        Nuke.loadImage(with: imageUrl, into: cell.posterImageView)

        return cell
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    var movies: [Movie] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=f896c80f9864bd5f36e35411cf3b28ac")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in

            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
            }

            guard let data = data else {
                print("❌ Data is nil")
                return
            }

            do {
                let decoder = JSONDecoder()

                let response = try decoder.decode(MoviesResponse.self, from: data)

                let movies = response.results
                
                DispatchQueue.main.async {
                    self?.movies = movies
                    self?.collectionView.reloadData()
                }

            } catch {
                print("❌ Error parsing JSON: \(error.localizedDescription)")
            }
        }

        task.resume()
        
        collectionView.dataSource = self
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout

        layout.minimumInteritemSpacing = 0

        layout.minimumLineSpacing = 2

        let numberOfColumns: CGFloat = 3

        let width = (collectionView.bounds.width - layout.minimumInteritemSpacing * (numberOfColumns - 1)) / numberOfColumns

        layout.itemSize = CGSize(width: width, height: width)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UICollectionViewCell,
           
           let indexPath = collectionView.indexPath(for: cell),
           
           let detailViewController = segue.destination as? DetailViewController {
            
            let movie = movies[indexPath.row]
            
            detailViewController.movie = movie
        }
    }
}
