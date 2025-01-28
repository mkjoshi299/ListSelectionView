# ListSelectionView
SwiftUI | Show array of data in List form

# Preview
![image](https://github.com/user-attachments/assets/3b480d82-2122-4fca-b5e7-cdcdda1d8508)

# How to Use it
<pre>
import SwiftUI
import ListSelectionView
struct ExampleView: View {

    @State var isSelectionListPresented: Bool = false
    var body: some View {
        Button {
            isSelectionListPresented = true
        } label: {
            Text("Show List View Controller")
        }
        .fullScreenCover(isPresented: $isSelectionListPresented, onDismiss: {
            isSelectionListPresented = false
        }, content: {
            ListSelectionView(viewModel: .init(dataSource: ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"], navigationTitle: "Naviagation Title"))
        })
    }
}
</pre>
