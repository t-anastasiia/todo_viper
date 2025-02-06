//
//  ToDoListView.swift
//  todo_viper
//
//  Created by Анастасия Талмазан on 2025-02-01.
//

import UIKit

// view - слой, отвечающий за прямое взаимодействие с пользователем

protocol ToDoListViewProtocol: AnyObject {
    func showToDoList(_ items: [ToDoItem])
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var presenter: ToDoListPresenterProtocol?
    
    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.register(ToDoItemCell.self, forCellReuseIdentifier: "ToDoItemCell")
        }
    }
    
    var items: [ToDoItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoaded()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

}

extension ViewController: ToDoListViewProtocol {
    func showToDoList(_ items: [ToDoItem]) {
        print("Items received:", items)
        self.items = items
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath) as? ToDoItemCell else {
            fatalError("ToDoItemCell not found")
        }
        
        let item = items[indexPath.row]
        cell.todoItem = item
        return cell
    }
    
}

class ToDoItemCell: UITableViewCell {
    
    @IBOutlet var checkBox: UIButton!
    @IBOutlet var title: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var date: UILabel!
    
    var todoItem: ToDoItem? {
        didSet {
            updateCell()
        }
    }
    
    private func updateCell() {
        if let item = todoItem {
            title.text = item.title
            descriptionLabel.text = item.description
            checkBox.isSelected = item.isCompleted
            
            checkBox.setImage(
                item.isCompleted ? UIImage(named: "checkmarkfill") : UIImage(named: "checkmark"),
                for: .normal
            )
        } else {
            print("todoItem is nil")
        }
    }
    
    @IBAction func toggleCheckBox(_ sender: UIButton) {
        todoItem?.isCompleted.toggle()
        updateCell()
    }
}
