//
//  ViewController.swift
//  PunkIPA
//
//  Created by Andrei Mirzac on 19/02/2020.
//  Copyright © 2020 Andrei Mirzac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 100
    registerCells()
  }

  func registerCells() {
      let nib = UINib(nibName: BeerListViewCell.reuseIdentifier, bundle: nil)
      tableView.register(nib, forCellReuseIdentifier: BeerListViewCell.reuseIdentifier)
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 30
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: BeerListViewCell.reuseIdentifier, for: indexPath) as? BeerListViewCell else {
        return UITableViewCell()
    }
   return cell
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  }
}

