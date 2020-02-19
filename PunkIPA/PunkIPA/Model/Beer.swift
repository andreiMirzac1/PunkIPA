//
//  Beer.swift
//  PunkIPA
//
//  Created by Andrei Mirzac on 19/02/2020.
//  Copyright © 2020 Andrei Mirzac. All rights reserved.
//

import Foundation
import AnyCodable

struct Beer: Decodable {
  let name: String
  let abv: Double
  let imageUrl: String
  let description: String
  let maltIngredients: [Ingredient]
  let hopsIngredients: [Ingredient]

  enum CodingKeys: String, CodingKey {
    case id
    case name
    case abv
    case imageUrl = "image_url"
    case description
    case ingredients
  }
  
  init(from decoder: Decoder) throws {

    let container = try decoder.container(keyedBy: CodingKeys.self)
    abv = try container.decode(Double.self, forKey: .abv)
    name = try container.decode(String.self, forKey: .name)
    imageUrl = try container.decode(String.self, forKey: .imageUrl)
    description = try container.decode(String.self, forKey: .description)

    let dictionary = try container.decode([String: AnyCodable].self, forKey: .ingredients)

    if let maltIngredients = dictionary["malt"]?.value as? [[String: Any]] {
      self.maltIngredients = try maltIngredients.compactMap({ try Ingredient(dict: $0) })
    } else {
      self.maltIngredients = []
    }

    if let hopsIngredients = dictionary["hops"]?.value as? [[String: Any]] {
      self.hopsIngredients = try hopsIngredients.compactMap({ try Ingredient(dict: $0) })
    } else {
      self.hopsIngredients = []
    }
  }
}

