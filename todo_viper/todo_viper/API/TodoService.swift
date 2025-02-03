//
//  TodoService.swift
//  todo_viper
//
//  Created by anastasiia talmazan on 2025-02-03.
//

import Foundation

protocol TodoServiceProtocol {
    func fetchTodoItems(completion: @escaping (Result<[ToDoItem], Error>) -> Void)
}

class TodoService: TodoServiceProtocol {
    func fetchTodoItems(completion: @escaping (Result<[ToDoItem], Error>) -> Void) {
        let mockItems = [
            ToDoItem(
                id: 1,
                title: "Купить продукты",
                description: "Молоко, хлеб, яйца",
                isCompleted: false,
                createdAt: Date()
            ),
            ToDoItem(
                id: 2,
                title: "Сделать домашку",
                description: "Математика и физика",
                isCompleted: true,
                createdAt: Date().addingTimeInterval(-86400)
            )
        ]
        completion(.success(mockItems))
    }
}
