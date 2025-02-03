//
//  ToDoListPresenter.swift
//  todo_viper
//
//  Created by Анастасия Талмазан on 2025-02-01.
//

import Foundation

// presenter - слой, "умеющий думать". отвечает за то, КАК обработать какое-то нажатие на кнопку, как отобразть происходящее "под капотом"

protocol ToDoListPresenterProtocol: AnyObject {
    func viewDidLoaded()
    func didLoad(todoItems: [ToDoItem]?)
}

class ToDoListPresenter {
    weak var view: ToDoListViewProtocol?
    var router: ToDoListRouterProtocol
    var interactor: ToDoListInteractorProtocol
    
    init(router: ToDoListRouterProtocol, interactor: ToDoListInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
}

// создаем подписку на протокол
extension ToDoListPresenter: ToDoListPresenterProtocol {
    func viewDidLoaded() {
        interactor.loadTodoItems()
    }
    
    func didLoad(todoItems: [ToDoItem]?) {
        <#code#>
    }
}
