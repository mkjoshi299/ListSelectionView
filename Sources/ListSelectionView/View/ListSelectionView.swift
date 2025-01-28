//
//  ContentView.swift
//  SelectionViewDemoApp
//
//  Created by RahulKumar on 28/01/25.
//

import SwiftUI

public struct ListSelectionView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel: ListSelectionViewModel
    
    public init(viewModel: ListSelectionViewModel) {
        _viewModel = .init(wrappedValue: viewModel)
    }
    
    public var body: some View {
        NavigationStack {
            VStack {
                if viewModel.filteredDataSource.isEmpty {
                    ContentUnavailableView("No Results for \"\(viewModel.searchText)\"", systemImage: "magnifyingglass")
                } else {
                    List(viewModel.filteredDataSource, id: \.self) { item in
                        Text(item)
                            .multilineTextAlignment(.leading)
                            .lineLimit(viewModel.textLineLimit)
                            .listRowSeparator(viewModel.filteredDataSource.first == item ? .hidden : .visible, edges: .top)
                            .contentShape(Rectangle())
                    }
                    .listStyle(.plain)
                }
            }
            .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
            .onChange(of: viewModel.searchText, { _, _ in
                viewModel.performSearch(for: viewModel.searchText)
            })
            .navigationTitle(viewModel.navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                }
            }
            
        }
    }
}

#Preview {
    ListSelectionView(viewModel: .init(dataSource: ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"], navigationTitle: "Select Naviagation"))
}
