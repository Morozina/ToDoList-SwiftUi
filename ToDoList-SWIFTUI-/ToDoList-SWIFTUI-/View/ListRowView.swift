//
//  ListElementView.swift
//  ToDoList-SWIFTUI-
//
//  Created by Vladyslav Moroz on 24/01/2023.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.Title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static let item1 = ItemModel(isCompleted: true, Title: "Title ove True")
    static let item2 = ItemModel(isCompleted: false, Title: "Title ove False")
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
