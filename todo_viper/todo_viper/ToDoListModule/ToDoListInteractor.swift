//
//  ToDoListInteractor.swift
//  todo_viper
//
//  Created by Анастасия Талмазан on 2025-02-01.
//

import UIKit

// interactor - слой, отвечающий за работу с данными

protocol ToDoListInteractorProtocol: AnyObject {
    func loadTodoItems()
}

// если тело интерактора небольшое - можно сразу подписаться, но если много приватных методов,
// то можно написать extention для интерактора, подписаться на него и ниже писать всю реализацию
class ToDoListInteractor: ToDoListInteractorProtocol {
    weak var presenter: ToDoListPresenterProtocol?
    private let todoService: TodoServiceProtocol
    
    init(service: TodoServiceProtocol = TodoService()) {
        self.todoService = service
    }
    
    func loadTodoItems() {
        todoService.fetchTodoItems { [weak self] result in
            switch result {
                case .success(let items):
                    print("Fetched items:", items)
                    self?.presenter?.didLoad(todoItems: items)
                case .failure(let error):
                    print("Error fetching items:", error) 
            }
        }
    }
}
