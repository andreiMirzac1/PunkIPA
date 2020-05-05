//
//  BeerDetailViewModel.swift
//  Beers
//
//  Created by Andrei Mirzac on 17/06/2018.
//  Copyright © 2018 Andrei Mirzac. All rights reserved.
//

import Foundation
import UIKit

class BeerDetailViewModel {

  let content: [SectionContent]

  init(beer: Beer) {

    content = [SectionContent.image(beer.imageUrl, title: beer.name, description: beer.description),
               SectionContent.ingredients(beer.ingredients.malt, sectionTitle: "Malt"),
               SectionContent.ingredients(beer.ingredients.hops, sectionTitle: "Hops")]
  }

  func sectionTitle(for index: Int) -> String? {
    switch content[index] {
    case .ingredients(_, let title): return title
    case .image: return nil
    }
  }
}

enum SectionContent {
  case image(String, title: String, description: String)
  case ingredients([Ingredient], sectionTitle: String)
}

extension SectionContent {
  var cellIdentifier: String {
    return String(describing: cellType)
  }

  var cellType: UITableViewCell.Type {
    switch  self {
    case .image:
      return BeerImageCell.self
    case .ingredients:
      return IngredientCell.self
    }
  }
}
