//
//  MainTableVeiwDataSource.swift
//  AssignmentProject
//
//  Created by Vivekvardhan Kasthuri on 27/11/19.
//  Copyright © 2019 Vivekvardhan Kasthuri. All rights reserved.
//

import UIKit

class MainTableVeiwDataSource: NSObject {
    
    var result: Welcome?
    init(tableView: UITableView,list: Welcome) {
        super.init()
        tableView.dataSource = self
        result = list
    }

}

extension MainTableVeiwDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (result?.rows.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewTableViewCell.identifier) as! CustomTableViewTableViewCell
        cell.updateData(row: result?.rows[indexPath.row])
        return cell
    }
}

