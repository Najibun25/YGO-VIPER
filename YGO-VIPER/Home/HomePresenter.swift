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

enum FetchError: Error {
    case failed
}


protocol HomePresenterProtocol {
    var router: HomeRouterProtocol?  { get set }
    var interactor: HomeInteractorProtocol? {get set}
    var view: HomeViewProtocol? {get set}

    func interactorDidFetchYGOdb(with result: Result< [Data], Error>)
    
    func didSelectedz(with viewModel: Data)

}


class HomePresenterYGO: HomePresenterProtocol{
    var router: HomeRouterProtocol?
    
    var interactor: HomeInteractorProtocol? {
        didSet {
            //ngambil gey ygo dari interactor
            interactor?.getYGOdb()
        }
    }
    
    var view: HomeViewProtocol?
    
    func interactorDidFetchYGOdb(with result: Result< [Data], Error>) {
        switch result {
        case .success(let ygodb):
            view?.update(with: ygodb)
        case .failure:
            view?.update(with: "Something wrong broo")
        }
    }
    
    func didSelectedz(with viewModel: Data) {
        guard let view = view else { return }
        router?.navigatetoDetail(from: view, viewModel: viewModel)
        
    }
}
