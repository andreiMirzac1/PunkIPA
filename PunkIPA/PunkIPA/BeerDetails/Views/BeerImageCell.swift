//
//  BeerImage.swift
//  Beers
//
//  Created by Andrei Mirzac on 17/06/2018.
//  Copyright © 2018 Andrei Mirzac. All rights reserved.
//

import UIKit
import Kingfisher

class BeerImageCell: UITableViewCell {
    
    @IBOutlet weak var beerImageView: UIImageView!
    @IBOutlet weak var beerTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

  func setUp(imageURL: String, title: String, description: String) {
        beerImageView.kf.setImage(with: URL(string: imageURL))
        beerTitleLabel.text = title
        descriptionLabel.text = description
    }
}
