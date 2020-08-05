//
//  ViewController.swift
//  pryanikyTestApp
//
//  Created by Georgij Malygin on 26/07/2020.
//  Copyright © 2020 Georgij Malygin. All rights reserved.
//

import UIKit

class SingleViewController: UIViewController {
    var tableView = UITableView()
    var presenter: ViewPresenterInterface!
    
    func registerViews() {
        tableView.register(HzTableViewCell.self, forCellReuseIdentifier: "HzTableViewCell")
        tableView.register(PictureViewCell.self, forCellReuseIdentifier: "PictureViewCell")
        tableView.register(SelectorViewCell.self, forCellReuseIdentifier: "SelectorViewCell")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = UIColor.white
        title = "Pryaniky"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.dataSource = self
        view.addSubview(tableView)
        registerViews()
        setupConstr()
    }
    
    func setupConstr() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
extension SingleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let array = presenter.model?.view?.count else {return 1}
    
        print(array)
        return array
     }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = presenter?.model?.data else {
            return UITableViewCell()
        }
        let a1 = presenter.model?.view![indexPath.row]
        if a1 == "hz" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HzTableViewCell", for: indexPath) as! HzTableViewCell
            cell.configure(data: data)
            print("xz")
            
            return cell
        }
        else if a1 == "picture" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PictureViewCell", for: indexPath) as! PictureViewCell
            cell.configure(data: data)
            print("pic")
            return cell
        }
        else if a1 == "selector" {
                let cell = tableView.dequeueReusableCell(withIdentifier: "SelectorViewCell") as! SelectorViewCell
            cell.configure(data: data)
            cell.actionHandler = { [weak self] index in
                let text = "Init \(index)"
                self!.showInfo(message: text)
            }
            return cell
        }
        else {
            return UITableViewCell()
            
        }
    }
    
    func showInfo(message: String) {
        let alert = UIAlertController(title: "Yeh right", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Nyyyy", style: .default, handler: {action in })
        
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
}
extension SingleViewController: ViewPresenterDecision {
    
    func success() {
        tableView.reloadData()
    }
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}
