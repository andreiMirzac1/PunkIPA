//
//  BeerListViewController.swift
//  PunkIPA
//
//  Created by Andrei Mirzac on 19/02/2020.
//  Copyright © 2020 Andrei Mirzac. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class BeerListViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  let disposeBag = DisposeBag()

  lazy var viewModel: BeerListViewModel =  {
    let url = "https://api.punkapi.com/v2/beers?page=1&per_page=80"
    let resource = Resource<[Beer]>(url: url)
    return BeerListViewModel(networkService: NetworkService(), resource: resource)
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 100
    registerCells()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    bindToViewModel()
  }

  func registerCells() {
    let nib = UINib(nibName: BeerListViewCell.reuseIdentifier, bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: BeerListViewCell.reuseIdentifier)
  }

  func bindToViewModel() {
    tableView.rx.setDelegate(self).disposed(by: disposeBag)

    viewModel.beers
      .subscribeOn(MainScheduler.instance)
      .bind(to: tableView.rx.items(cellIdentifier: BeerListViewCell.reuseIdentifier, cellType: BeerListViewCell.self)) { (row, beer, cell) in
        cell.setUp(beer: beer)
    }.disposed(by: disposeBag)
  }
}

extension BeerListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  }
}

