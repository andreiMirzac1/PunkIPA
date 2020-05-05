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
  let ingredients: Ingredients

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
    ingredients = try container.decode(Ingredients.self, forKey: .ingredients)
  }
}


