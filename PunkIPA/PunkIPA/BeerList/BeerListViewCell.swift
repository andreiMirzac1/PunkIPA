//
//  BeerListViewCell.swift
//  PunkIPA
//
//  Created by Andrei Mirzac on 19/02/2020.
//  Copyright © 2020 Andrei Mirzac. All rights reserved.
//

import UIKit
import Kingfisher

class BeerListViewCell: UITableViewCell {
  @IBOutlet var beerImageView: UIImageView!
  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var abvLabel: UILabel!

  func setUp(beer: Beer) {
    let url = URL(string: beer.imageUrl)
     beerImageView.kf.setImage(with: url)
    nameLabel.text = beer.name
    abvLabel.text = String(beer.abv)
  }
}


