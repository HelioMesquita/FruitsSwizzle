//
//  ViewController.swift
//  FruitList
//
//  Created by Hélio Mesquita on 31/07/21.
//

import UIKit
import Fruits
import FruitsSwizzle

class TableViewController: UITableViewController {
    
    lazy var list: [Fruit] = FruitSalad.salad()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = list[indexPath.row].fruitName
        cell.detailTextLabel?.text = list[indexPath.row].detail()
        cell.detailTextLabel?.numberOfLines = 0
        return cell
    }

    @IBAction func swizzle(_ sender: Any) {
        let orange = list.first(where: {$0 is Orange}) as! Orange
        orange.swizzle()
        tableView.reloadData()
    }
}
