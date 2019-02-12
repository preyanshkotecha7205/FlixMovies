//
//  MovieCell.swift
//  nnetflix
//
//  Created by Preyansh Kotecha on 2/11/19.
//  Copyright © 2019 preyansh. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

  
    @IBOutlet weak var posterImage: UIImageView!
    
    
    @IBOutlet weak var movieName: UILabel!
    
    
    @IBOutlet weak var overview: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
