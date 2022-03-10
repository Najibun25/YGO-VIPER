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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func update(with ygodb: [YGOdb]) {
        
    }
    
    func update(with error: String){
        
    }
}

extension HomeViewYGOController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}





