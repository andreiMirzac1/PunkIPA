//
//  UITableViewCellExtension.swift
//  PunkIPA
//
//  Created by Andrei Mirzac on 19/02/2020.
//  Copyright © 2020 Andrei Mirzac. All rights reserved.
//

import UIKit

extension UITableViewCell {
  public static var reuseIdentifier: String {
    return String(describing: self)
  }
}
