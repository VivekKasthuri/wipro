//
//  ViewController.swift
//  AssignmentProject
//
//  Created by Vivekvardhan Kasthuri on 27/11/19.
//  Copyright © 2019 Vivekvardhan Kasthuri. All rights reserved.
//

import UIKit
import Reachability

class MainViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var tableViewDatsource: MainTableVeiwDataSource?
    var list: Welcome?
    private let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(getData), for: .valueChanged)
        tableView.register(UINib(nibName: "CustomTableViewTableViewCell", bundle: nil), forCellReuseIdentifier: CustomTableViewTableViewCell.identifier)
        self.tableView.estimatedRowHeight = 45
        self.tableView.rowHeight = UITableView.automaticDimension

        self.checkForInternetConnection()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
    func checkForInternetConnection() {
        let reachability = try! Reachability()
        switch reachability.connection {
        case .wifi:
            print("Reachable via WiFi")
            getData()
        case .cellular:
            print("Reachable via Cellular")
            getData()
        case .unavailable:
          print("Network not reachable")
        case .none:
            print("Some issues")
        }
    }
    
    @objc func getData() {
        NetworkRequest.getList(success: { (welcome) in
                self.list = welcome
                DispatchQueue.main.async {
                    self.self.tableViewDatsource = MainTableVeiwDataSource(tableView: self.tableView, list: self.list!)
                    self.tableView.reloadData()
                    self.navigationController?.topViewController?.navigationItem.title = self.list?.title
                    self.refreshControl.endRefreshing()
                }
            }) { (error) in
                switch error {
                case .error:
                    print("Error")
                case .success:
                    print("Success")
            }
        }
    }
}

extension MainViewController: UITableViewDelegate {
    
    
}




