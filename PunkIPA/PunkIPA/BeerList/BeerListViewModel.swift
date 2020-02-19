//
//  BeerListViewModel.swift
//  PunkIPA
//
//  Created by Andrei Mirzac on 19/02/2020.
//  Copyright © 2020 Andrei Mirzac. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class BeerListViewModel {

  private let disposeBag = DisposeBag()
  let beers: BehaviorRelay<[Beer]> = BehaviorRelay(value: [])

  init(networkService: NetworkService, resource: Resource<[Beer]>) {
    networkService.load(resource).subscribe(onNext: { [weak self] beers in
      self?.beers.accept(beers)
    }).disposed(by: disposeBag)
  }

}
