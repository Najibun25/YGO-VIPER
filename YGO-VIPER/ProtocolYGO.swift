//
//  ProtocolYGO.swift
//  YGO-VIPER
//
//  Created by ddl on 16/03/22.
//

import Foundation

protocol HomeViewProtocol {
    var presenter: HomePresenterProtocol? {get set}
    func update(with ygodb: [Data])
    func update(with error: String)
}

protocol HomeInteractorProtocol {
    var presenter: HomePresenterProtocol? { get set }
    // interactor hanya inform saat ready
    func getYGOdb()
    func searchYGOdb(with query: String)
    // need to tell presenter
}

protocol HomePresenterProtocol {
    var router: HomeRouterProtocol? { get set }
    var interactor: HomeInteractorProtocol? {get set}
    var view: HomeViewProtocol? {get set}

    func interactorDidFetchYGOdb(with result: Result< [Data], Error>)
    func didSelectedz(with viewModel: Data)
    func didGetSearch(with query: String)
    // func getQuery()
}

typealias EntryPoint = HomeViewYGOController

protocol HomeRouterProtocol {
    //tell delegetae untuk kasih entry point di apps
    var entry: EntryPoint? { get }
    static func start() -> HomeRouterProtocol
    func navigatetoDetail(from view: HomeViewProtocol, viewModel: Data)
}
