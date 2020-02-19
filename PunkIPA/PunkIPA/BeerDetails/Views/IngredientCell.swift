//
//  IngredientCell.swift
//  Beers
//
//  Created by Andrei Mirzac on 17/06/2018.
//  Copyright © 2018 Andrei Mirzac. All rights reserved.
//

import Foundation
import UIKit

class IngredientCell: UITableViewCell {
    
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var amountLabel: UILabel!
  @IBOutlet weak var valueLabel: UILabel!
  @IBOutlet weak var unitLabel: UILabel!

    func setup(_ ingredient: Ingredient) {
      nameLabel.text = ingredient.name.localizedCapitalized
      amountLabel.text = "Amount"
      valueLabel.text = String(ingredient.amount.value)
      unitLabel.text = ingredient.amount.unit
    }

}
