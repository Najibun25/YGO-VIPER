//
//  HomeRouter.swift
//  YGO-VIPER
//
//  Created by ddl on 11/03/22.
//

import Foundation
import UIKit

// Object
// EntryPoint for our modul.

class HomeRouterYGO: HomeRouterProtocol {
    func navigatetoDetail(from view: HomeViewProtocol, viewModel: Data) {
        let destinationVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        destinationVC.viewModel = viewModel
        // destinationVC.presenter?.viewModel = viewModel
        if let view = view as? UIViewController {
            view.navigationController?.pushViewController(destinationVC, animated: true)
        }
    }
    
    var entry: EntryPoint?
    static func start() -> HomeRouterProtocol {
        let router = HomeRouterYGO()
        // assign VIP
        var view: HomeViewProtocol = HomeViewYGOController()
        var presenter: HomePresenterProtocol = HomePresenterYGO()
        var interactor: HomeInteractorProtocol = HomeInteractorYGO()
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        router.entry = view as? EntryPoint
        return router
    }
}
