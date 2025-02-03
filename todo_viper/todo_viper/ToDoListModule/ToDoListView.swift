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

class ViewController: UIViewController {
    var presenter: ToDoListPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoaded()
    }


}

extension ViewController: ToDoListViewProtocol {
    func showToDoList(_ items: [ToDoItem]) {
        <#code#>
    }
    
}
