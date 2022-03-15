//
//  HomeInteractor.swift
//  YGO-VIPER
//
//  Created by ddl on 11/03/22.
//

import Foundation

//Object
//Protocol
//Only have reeff to Prresenter
//Go maybe got data, interaction complete, presenter take what to do
// taruh api disini
// all api yugi = https://db.ygoprodeck.com/api/v7/cardinfo.php 11 rb data
// card yugi yang keluar di tahun ini https://db.ygoprodeck.com/api/v7/cardinfo.php?&startdate=01/01/2022&enddate=02/28/2022&dateregion=tcg_date <--- pakai uyang ini
// api search = https://db.ygoprodeck.com/api/v7/cardinfo.php?fname=tri-brigade
//try https://jsonplaceholder.typicode.com/users
//try with news api https://newsapi.org/v2/top-headlines?country=us&apiKey=c75d59fc8e1149b8923cf50b19d49a63
//backbone

protocol HomeInteractorProtocol {
    var presenter: HomePresenterProtocol? { get set }
    
    //interactor hanya inform saat ready
    func getYGOdb()
    //need to tell presenter
    
}

class HomeInteractorYGO: HomeInteractorProtocol {
    var presenter: HomePresenterProtocol?
    
    struct ConstantAPI {
        static let initialURL = URL(string: "https://db.ygoprodeck.com/api/v7/cardinfo.php")
        
        static let searchURL = "https://db.ygoprodeck.com/api/v7/cardinfo.php?fname="
        
        
    }
    
    
    func getYGOdb() {
        print("Start fetching")
        guard let  url = ConstantAPI.initialURL else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                //passsing error
                self?.presenter?.interactorDidFetchYGOdb(with: .failure(FetchError.failed))
                return
            }
            do {
                //something wrong ion here
                let entities = try JSONDecoder().decode(YGOdb.self, from: data)
                
                self?.presenter?.interactorDidFetchYGOdb(with: .success(entities.data))
                //print(entities)
                //print("data keambil = \(entities.count)")
                //print("Data keambil: \(entities.data)")
                print("di fetch")
            }
            catch {
                self?.presenter?.interactorDidFetchYGOdb(with: .failure(error))
                print("masuk catch error")
            }
        }
        task.resume()
        ///hoho ha ha ha
    }
    
    
    //
    //not done yet
    func searchYGOdb(with query: String) {
        //biar kalo orang ngasih spasi spasi dianggep empty
        guard !query.trimmingCharacters(in: .whitespaces).isEmpty else{
            return
        }
        
        let urlString = ConstantAPI.searchURL + query
        guard var urlStringCombine = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return
        }
        
        guard let  url = URL(string: urlStringCombine) else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                //passsing error
                self?.presenter?.interactorDidFetchYGOdb(with: .failure(FetchError.failed))
                return
            }
            do {
                //something wrong ion here
                let entities = try JSONDecoder().decode(YGOdb.self, from: data)
                
                self?.presenter?.interactorDidFetchYGOdb(with: .success(entities.data))
                //print(entities)
                //print("data keambil = \(entities.count)")
                //print("Data keambil: \(entities.data)")
                print("di fetch")
            }
            catch {
                self?.presenter?.interactorDidFetchYGOdb(with: .failure(error))
                print("masuk catch error")
            }
        }
        task.resume()
        ///hoho ha ha ha
    }
    
    
    
    
}

