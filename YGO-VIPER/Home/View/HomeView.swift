//
//  HomeView.swift
//  YGO-VIPER
//
//  Created by ddl on 11/03/22.
//

import Foundation
import UIKit
// import SwiftUI

// Responsible for user interface
// as viewController
// referrence to presenter

class HomeViewYGOController: UIViewController, HomeViewProtocol {
    var presenter: HomePresenterProtocol?
    // create tableview programatically
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UINib(nibName: DBYGOListCell.nibName, bundle: nil),
                       forCellReuseIdentifier: DBYGOListCell.cellIdentifier)
        table.isHidden = true
        return table
    }()
    // bikin kalo misal salah kelaur label
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.isHidden = true
        return label
        // addHeader()
    }()
    var ygodb: [Data] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.backgroundColor = .systemBlue
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        setNavigationBar()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        // for error
        label.center = view.center
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        label.center = view.center
    }
    func setNavigationBar() {
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 44))
        view.addSubview(navBar)
        self.navigationItem.title = "YGO MIni DB"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        //_ = UINavigationItem(title: "YGO Mini DB")
        
//        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 44))
//        view.addSubview(navBar)
//
//        let navItem = UINavigationItem(title: "SomeTitle")
//        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(selectorName:))
//        navItem.rightBarButtonItem = doneItem
//
//        navBar.setItems([navItem], animated: false)
    }
    func update(with ygodb: [Data]) {
        // dah diambil ama intreaktor, dan kalau presenter dah nge okein pake switch update di view
        // print("got user")
        DispatchQueue.main.async {
            self.ygodb = ygodb
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
    }
    func update(with error: String) {
        print("got user")
        DispatchQueue.main.async {
            self.ygodb = []
            self.label.text = error
            self.tableView.isHidden = true
            self.label.isHidden = false
        }
    }
}

extension HomeViewYGOController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ygodb.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // safe to force cast when you need is force cast in tableview??
        // swiftlint:disable force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier: DBYGOListCell.cellIdentifier, for: indexPath)
            as! DBYGOListCell
        cell.configureDisplay(with: ygodb[indexPath.row])
        return cell
        // swiftlint:enable force_cast
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectedz(with: ygodb[indexPath.row])
    }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Header"
//    }
}
