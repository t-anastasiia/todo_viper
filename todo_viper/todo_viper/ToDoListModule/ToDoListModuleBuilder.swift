//
//  ToDoListModuleBuilder.swift
//  todo_viper
//
//  Created by anastasiia talmazan on 2025-02-03.
//

import UIKit

class ToDoListModuleBuilder {
    // статичный, так как мы создаем модуль, независящий от класса
    static func build() -> ViewController {
        let interactor = ToDoListInteractor()
        let router = ToDoListRouter()
        let presenter = ToDoListPresenter(router: router,
                                          interactor: interactor)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "Main") as! ViewController
        viewController.presenter = presenter
        presenter.view = viewController
        interactor.presenter = presenter
        router.presenter = presenter
        return viewController
    }
}
