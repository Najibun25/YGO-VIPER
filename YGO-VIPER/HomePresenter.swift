//
//  HomePresenter.swift
//  YGO-VIPER
//
//  Created by ddl on 11/03/22.
//

import Foundation

// ties everythinhg together
//object
//protocol
//reff to interactor, router, view
// need

protocol HomePresenterProtocol {
    var router: HomeRouterProtocol?  { get set }
    var interactor: HomeInteractorProtocol? {get set}
    var view: HomeViewProtocol? {get set}

    func interactorDidFetchYGOdb(with result: Result<[YGOdb], Error>)

}


class HomePresenterYGO: HomePresenterProtocol{
    var router: HomeRouterProtocol?
    
    var interactor: HomeInteractorProtocol?
    
    var view: HomeViewProtocol?
    
    func interactorDidFetchYGOdb(with result: Result<[YGOdb], Error>) {
        
    }
}
