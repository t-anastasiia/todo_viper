//
//  ToDoListRouter.swift
//  todo_viper
//
//  Created by Анастасия Талмазан on 2025-02-01.
//

import UIKit

// router - слой, реализующий переход на другой модуль, механизм скрытия текущего модуля
// сам не принимает решения, ему о них сообщается presenter

protocol ToDoListRouterProtocol: AnyObject {
    
}

class ToDoListRouter: ToDoListRouterProtocol {
    weak var presenter: ToDoListPresenterProtocol? // презентор ссылается на роутер сильно, а роутер на презентор - слабо
}
