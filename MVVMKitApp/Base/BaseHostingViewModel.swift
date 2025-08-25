//
//  BaseHostingViewModel.swift
//  MVVMKitApp
//
//  Created by Hilal İnan on 19.08.2025.
//

import Foundation
import Combine

protocol BaseHostingViewModelProtocol: ObservableObject {
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
}

class BaseHostingViewModel<R: BaseRouterProtocol>: BaseHostingViewModelProtocol {
    
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
