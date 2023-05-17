//
//  ViewController.swift
//  IOS_Project_2_Flixster
//
//  Created by Ana Alfaro-Garcia on 05/15/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var movies: [Movie] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        let movie = movies[indexPath.row]
        cell.configure(with: movie)

        return cell


    }
    
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

                    self?.tableView.reloadData()
                }


            } catch {
                print("❌ Error parsing JSON: \(error.localizedDescription)")
            }
        }

        task.resume()

        
        tableView.dataSource =  self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell,
           
           let indexPath = tableView.indexPath(for: cell),
           
           let detailViewController = segue.destination as? DetailViewController {
            
            let movie = movies[indexPath.row]
            
            detailViewController.movie = movie
        }
    }


}
