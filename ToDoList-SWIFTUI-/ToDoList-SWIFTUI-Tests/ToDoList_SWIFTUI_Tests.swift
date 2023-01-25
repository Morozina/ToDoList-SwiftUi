//
//  ToDoList_SWIFTUI_Tests.swift
//  ToDoList-SWIFTUI-Tests
//
//  Created by Vladyslav Moroz on 25/01/2023.
//

import XCTest
@testable import ToDoList_SWIFTUI_

class ListViewModelTests: XCTestCase {
    var viewModel: ListViewModel!
    var testData: [ItemModel]!
    
    override func setUp() {
        super.setUp()
        viewModel = ListViewModel()
        testData = [ItemModel(isCompleted: false, Title: "Test Item 1"),
                    ItemModel(isCompleted: true, Title: "Test Item 2")]
    }
    
    func testGetItems() {
        UserDefaults.standard.set(try? JSONEncoder().encode(testData), forKey: "items_list")
        viewModel.getItems()
        XCTAssertEqual(viewModel.listText, testData)
    }
    
    func testDeleteItem() {
        viewModel.listText = testData
        viewModel.deleteItem(IndexSet: [1])
        XCTAssertEqual(viewModel.listText.count, 1)
        XCTAssertEqual(viewModel.listText[0].Title, "Test Item 1")
    }

    
    func testAddGoal() {
        viewModel.addGoal(text: "Test Item 3")
        XCTAssertEqual(viewModel.listText.count, 1)
        XCTAssertEqual(viewModel.listText[0].Title, "Test Item 3")
    }
    
    func testUpdateList() {
        viewModel.listText = testData
        let item = viewModel.listText[0]
        let _ = item.updateCompletion()
        viewModel.updateList(text: item)
        XCTAssertEqual(viewModel.listText[0].isCompleted, true)
    }
    
    func testSaveItems() {
        viewModel.listText = testData
        viewModel.saveItems()
        let savedData = UserDefaults.standard.data(forKey: "items_list")
        XCTAssertNotNil(savedData)
        let decodedData = try? JSONDecoder().decode([ItemModel].self, from: savedData!)
        XCTAssertNotNil(decodedData)
        XCTAssertEqual(decodedData, testData)
    }
}

extension ItemModel: Equatable {
    public static func == (lhs: ItemModel, rhs: ItemModel) -> Bool {
        return lhs.id == rhs.id && lhs.isCompleted == rhs.isCompleted && lhs.Title == rhs.Title
    }
}

