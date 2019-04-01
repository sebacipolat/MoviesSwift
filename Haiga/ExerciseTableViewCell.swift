//
//  ExerciseTableViewCell.swift
//  Haiga
//
//  Created by Sebastian Cipolat on 30/03/2019.
//  Copyright © 2019 Sebastian Cipolat. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ExerciseTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var labelCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

        public func fill(data:Movie) {
            self.labelCell.text = data.originalTitle
            let urlImage="https://image.tmdb.org/t/p/w780/"
            
            Alamofire.request(urlImage+data.backdropPath).responseImage { response in
                if let image = response.result.value {
                    self.imageCell.image=image
                }
            }
     }
}
