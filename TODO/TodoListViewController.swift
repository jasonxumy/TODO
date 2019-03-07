//
//  ViewController.swift
//  TODO
//
//  Created by xumingyou on 2019/3/6.
//  Copyright © 2019 xumingyou. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    let itemArray = ["购买水杯","吃药","修改密码"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //用户单击单元格以后会呈现勾选标记
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        //用户单击单元格以后灰色高度会逐步变淡消失
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

