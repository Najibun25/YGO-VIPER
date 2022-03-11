//
//  HomeView.swift
//  YGO-VIPER
//
//  Created by ddl on 11/03/22.
//

import Foundation
import UIKit

// Responsible for user interface
// as viewController
// referrence to presenter


protocol HomeViewProtocol {
    var presenter: HomePresenterProtocol? {get set}
    
    func update(with ygodb: [YGOdb])
    func update(with error: String)
    
}

class HomeViewYGOController: UIViewController, HomeViewProtocol {
    var presenter: HomePresenterProtocol?
    
    //create tableview programatically
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.isHidden = true
        return table
    }()
    var ygodb: [YGOdb] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        print("jumalh keambil = \(ygodb.count)")
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func update(with ygodb: [YGOdb]) {
        // dah diambil ama intreaktor, dan kalau presenter dah nge okein pake switch update di view
        DispatchQueue.main.async {
            self .ygodb = ygodb
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
        
        
    }
    
    func update(with error: String){
        
    }
}

extension HomeViewYGOController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ygodb.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = ygodb[indexPath.row].name
//        return cell
    }
    
    
}





