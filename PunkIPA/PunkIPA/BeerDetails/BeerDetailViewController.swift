//
//  File.swift
//  Beers
//
//  Created by Andrei Mirzac on 17/06/2018.
//  Copyright © 2018 Andrei Mirzac. All rights reserved.
//

import UIKit

class BeerDetailViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  private var viewModel: BeerDetailViewModel

  init(viewModel: BeerDetailViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    registerCells()
  }

  func registerCells() {
    for contentItem in viewModel.content {
      tableView.register(UINib(nibName: contentItem.cellIdentifier, bundle: nil), forCellReuseIdentifier: contentItem.cellIdentifier)
    }
  }
}

extension BeerDetailViewController: UITableViewDataSource {

  func numberOfSections(in tableView: UITableView) -> Int {
    return viewModel.content.count
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch viewModel.content[section] {
    case .ingredients(let ingredients, _): return ingredients.count
    case .image: return 1
    }
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let contentItem = viewModel.content[indexPath.section]
    let cell = tableView.dequeueReusableCell(withIdentifier: contentItem.cellIdentifier, for: indexPath)

    switch contentItem {
    case .image(let imageUrl, title: let title, let description):
      if let cell = cell as? BeerImageCell {
        cell.setUp(imageURL: imageUrl, title: title, description: description)
      }
    case .ingredients(let ingredients, _):
      if let cell = cell as? IngredientCell {
        cell.setup(ingredients[indexPath.row])
      }
    }
    return cell
  }

  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return viewModel.sectionTitle(for: section)
  }

}
