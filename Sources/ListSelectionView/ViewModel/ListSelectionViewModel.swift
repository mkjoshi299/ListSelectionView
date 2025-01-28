//
//  ListSelectionViewModel.swift
//  SelectionViewDemoApp
//
//  Created by RahulKumar on 28/01/25.
//

import Foundation

public final class ListSelectionViewModel: ObservableObject {
    
    var dataSource: [String]
    @Published var filteredDataSource: [String] = []
    @Published var searchText: String = ""
    var navigationTitle: String
    var textLineLimit: Int = 1
    
   public init(dataSource: [String], navigationTitle: String, textLineLimit: Int = 1) {
        self.dataSource = dataSource
        self.filteredDataSource = dataSource
        self.textLineLimit = textLineLimit
        self.navigationTitle = navigationTitle
    }

    func performSearch(for searchText: String) {
        if searchText.isEmpty {
            filteredDataSource = dataSource
        } else {
            filteredDataSource = dataSource.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }

}
