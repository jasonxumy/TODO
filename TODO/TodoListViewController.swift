//
//  ViewController.swift
//  TODO
//
//  Created by xumingyou on 2019/3/6.
//  Copyright © 2019 xumingyou. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    let defaults = UserDefaults.standard
    
    var itemArray = ["购买水杯","吃药","修改密码"]
    override func viewDidLoad() {
        super.viewDidLoad()
        if let items = defaults.array(forKey: "ToDoListArray") as? [String] {
            itemArray = items
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title:"添加一个新的ToDo项目",message:"",preferredStyle:.alert)
        
        let action = UIAlertAction(title:"添加项目",style:.default) {(action) in
        //当用户单击添加项目按钮以后要执行的代码
            self.itemArray.append(textField.text!)
            self.defaults.set(self.itemArray,forKey:"ToDoListArray")
            self.tableView.reloadData()
        }
        
        alert.addTextField {(alertTextFiled) in
            alertTextFiled.placeholder = "创建一个新项目..."
            textField = alertTextFiled
        }
        
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
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

