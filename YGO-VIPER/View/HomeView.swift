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
    
    func update(with ygodb: [Data])
    func update(with error: String)
    
}

class HomeViewYGOController: UIViewController, HomeViewProtocol {
    var presenter: HomePresenterProtocol?
    
    //create tableview programatically
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UINib(nibName: DBYGOListCell.nibName, bundle: nil), forCellReuseIdentifier: DBYGOListCell.cellIdentifier)
        table.isHidden = true
        return table
    }()
    
    //bikin kalo misal salah kelaur label
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    var ygodb: [Data] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.backgroundColor = .systemBlue
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        //print("jumalh keambil = \(ygodb.count)")
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        //for error
        label.center = view.center
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        label.center = view.center
    }
    
    func update(with ygodb: [Data]) {
        // dah diambil ama intreaktor, dan kalau presenter dah nge okein pake switch update di view
        //print("got user")
        DispatchQueue.main.async {
            self.ygodb = ygodb
            self.tableView.reloadData()
            self.tableView.isHidden = false
            //print("jumalh keambil = \(ygodb.count)")
        }
    }
    
    func update(with error: String){
        print("got user")
        DispatchQueue.main.async {
            self.ygodb = []
            self.label.text = error
            self.tableView.isHidden = true
            self.label.isHidden = false
            //print("jumalh keambil = \(ygodb.count)")
        }
    }
}

extension HomeViewYGOController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ygodb.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
        //will back when we get data fetching done
//        let cell = tableView.dequeueReusableCell(withIdentifier: DBYGOListCell.cellIdentifier, for: indexPath) as! DBYGOListCell
//        cell.cardName.text = ygodb[indexPath.row].name
//        //cell.backgroundColor = .systemBlue
//        return cell
    }
    
    
}





