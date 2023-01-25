//
//  ListViewModel.swift
//  ToDoList-SWIFTUI-
//
//  Created by Vladyslav Moroz on 25/01/2023.
//

import Foundation

final class ListViewModel: ObservableObject {
    
    @Published var listText: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let keySet = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: keySet),
            let decodedData = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        listText = decodedData
    }
    
    func deleteItem(IndexSet: IndexSet) {
        listText.remove(atOffsets: IndexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        listText.move(fromOffsets: from, toOffset: to)
    }
    
    func addGoal(text: String) {
        let newItem = [ItemModel(isCompleted: false, Title: text)]
        listText.append(contentsOf: newItem)
    }
    
    func updateList(text: ItemModel) {
        if let index = listText.firstIndex(where: { $0.id == text.id}) {
            listText[index] = text.updateCompletion()
        }
    }
    
    func saveItems() {
        guard let encodedData = try? JSONEncoder().encode(listText) else { return }
        UserDefaults.standard.set(encodedData, forKey: keySet)
    }
}
