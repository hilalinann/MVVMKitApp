//
//  BaseViewModel.swift
//  MVVMKitApp
//
//  Created by Hilal İnan on 12.08.2025.
//

import Foundation
import Combine

protocol BaseViewModelProtocol: AnyObject {
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
}

class BaseViewModel<R: BaseRouterProtocol>: ObservableObject, BaseViewModelProtocol {
    let router: R
    var cancellables = Set<AnyCancellable>()

    init(router: R) {
        self.router = router
    }

    func viewDidLoad() {}
    func viewWillAppear() {}
    func viewDidAppear() {}
    func viewWillDisappear() {}
    func viewDidDisappear() {}
}

