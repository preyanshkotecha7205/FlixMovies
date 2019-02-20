//
//  MovieGridController.swift
//  nnetflix
//
//  Created by Preyansh Kotecha on 2/19/19.
//  Copyright © 2019 preyansh. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieGridController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    
    var movies = [[String:Any]]()
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieGridCell", for: indexPath) as! MovieGridCell
        let movie = movies[indexPath.item]
        
        let base = "https://image.tmdb.org/t/w185"
        let poster_path = movies[indexPath.row]["poster_path"] as! String
        let final_url = base + poster_path
        let url = URL(string: final_url)!
        cell.PosterView.af_setImage(withURL: url)
        return cell
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/297762/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US&page=1")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                self.movies = dataDictionary["results"] as! [[String:Any]]
                
                self.collectionView.reloadData()

                print(self.movies)
        }
            
            
            
            /*
             // MARK: - Navigation
             
             // In a storyboard-based application, you will often want to do a little preparation before navigation
             override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
             // Get the new view controller using segue.destination.
             // Pass the selected object to the new view controller.
             }
             */
            
        }
        
        task.resume()
    }
    

}
