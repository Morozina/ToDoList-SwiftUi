//
//  ItemModel.swift
//  ToDoList-SWIFTUI-
//
//  Created by Vladyslav Moroz on 24/01/2023.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    var id = UUID().uuidString
    var isCompleted: Bool
    var Title: String
    
    init(id: String = UUID().uuidString, isCompleted: Bool, Title: String) {
        self.id = id
        self.isCompleted = isCompleted
        self.Title = Title
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(isCompleted: !isCompleted, Title: Title)
    }
}
