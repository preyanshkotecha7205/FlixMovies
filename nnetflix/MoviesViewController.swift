//
//  ViewController.swift
//  nnetflix
//
//  Created by Preyansh Kotecha on 2/10/19.
//  Copyright © 2019 preyansh. All rights reserved.
//

import UIKit
import AlamofireImage

class MoviesViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate {
    
    
    
    
    @IBOutlet weak var tableview: UITableView!
    
    
    var movies = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetch()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableview.dataSource = self
        tableview.delegate = self
        tableview.rowHeight = 160
        
        print("hello")
    
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "movieCell") as! MovieCell
        
        let movie = movies[indexPath.row]
        let title = movie["title"] as! String
        let synnopsis = movie["overview"] as! String
    
        
        cell.movieName.text = title
        cell.overview.text = synnopsis
        
        let base = "https://image.tmdb.org/t/p/w185"
        let poster_path = movie["poster_path"] as! String
        let final_url = base + poster_path
        let url = URL(string: final_url)!
        cell.posterImage.af_setImage(withURL: url)
        
        
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

         print("loading up data")
        
//        find the selected movie
        let cell = sender as! UITableViewCell
        let indexPath = tableview.indexPath(for: cell)!
        let movie = movies[indexPath.row]
        
//        Pass the selected movie details to the view controller
        let detailsViewController = segue.destination as! MovieDetailViewController
        detailsViewController.movie = movie
        tableview.deselectRow(at: indexPath, animated: true)
//        additional setup after loading the view
        
        print(movie["title"])
    }
    
    
    
    func fetch() {
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                // TODO: Get the array of movies
                // TODO: Store the movies in a property to use elsewhere
                // TODO: Reload your table view data
               self.movies = dataDictionary["results"] as! [[String:Any]]
                self.tableview.reloadData()
                
                print(dataDictionary)
            }
        }
        task.resume()
        
    }
    
    
}





