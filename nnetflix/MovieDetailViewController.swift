//
//  MovieDetailViewController.swift
//  nnetflix
//
//  Created by Preyansh Kotecha on 2/11/19.
//  Copyright © 2019 preyansh. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieDetailViewController: UIViewController {

    
    @IBOutlet weak var bakcdropView: UIImageView!
    
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    var movie: [String:Any]!
       
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        
        synopsisLabel.text = movie["overview"] as? String
        synopsisLabel.sizeToFit()
        
        
        let base = "https://image.tmdb.org/t/p/w185"
        let poster_path = movie["poster_path"] as! String
        let final_url = base + poster_path
        let url = URL(string: final_url)!
        posterView.af_setImage(withURL: url)
        
        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)
        bakcdropView.af_setImage(withURL: backdropUrl!)
        
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
