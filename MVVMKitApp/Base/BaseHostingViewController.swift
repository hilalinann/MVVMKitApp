//
//  BaseHostingViewController.swift
//  MVVMKitApp
//
//  Created by Hilal İnan on 19.08.2025.
//

import Foundation
import SwiftUI

class BaseHostingViewController<Content: View, V: BaseHostingViewModelProtocol>: UIHostingController<Content> {
    
    let viewModel: V
    let contentView : Content
    
    required init(contentView: Content, viewModel: V) {
        self.contentView = contentView
        self.viewModel = viewModel
        super.init(rootView: contentView)
    }
    
    @MainActor @preconcurrency required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.viewDidAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.viewWillDisappear()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear()
    }
}
