//
//  HomeRouter.swift
//  YGO-VIPER
//
//  Created by ddl on 11/03/22.
//

import Foundation
import UIKit

//Object
// EntryPoint for our modul.

typealias EntryPoint = HomeViewYGOController

protocol HomeRouterProtocol {
    //tell delegetae untuk kasih entry point di apps
    //dont forget to ? in entrypoint, bikin error 1 malam
    var entry: EntryPoint? { get }
    
    static func start() -> HomeRouterProtocol
    
    func navigatetoDetail(from view: HomeViewProtocol, viewModel: Data)
}

class HomeRouterYGO: HomeRouterProtocol {
    func navigatetoDetail(from view: HomeViewProtocol, viewModel: Data) {
        let destinationVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        destinationVC.viewModel = viewModel
        //destinationVC.presenter?.viewModel = viewModel
        if let view = view as? UIViewController{
            view.navigationController?.pushViewController(destinationVC, animated: true)
        }
    }
    
    
    var entry: EntryPoint?
    
    static func start() -> HomeRouterProtocol {
        let router = HomeRouterYGO()
        
        //assign VIP
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


