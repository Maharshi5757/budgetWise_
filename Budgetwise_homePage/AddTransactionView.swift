import SwiftUI

struct AddTransactionView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var categories: [BudgetCategory]
    @State private var selectedCategory = 0
    @State private var amount = ""

    var body: some View {
        NavigationView {
            Form {
                Picker("Category", selection: $selectedCategory) {
                    ForEach(0..<categories.count) { index in
                        Text(categories[index].name).tag(index) 
                    }
                }
                
                TextField("Amount", text: $amount)
                    .keyboardType(.decimalPad)
                
                Button("Add Transaction") {
                    // Validate and add transaction
                    if let amountValue = Double(amount), amountValue > 0 {
                        categories[selectedCategory].spent += amountValue
                        amount = ""
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add Transaction")
            .navigationBarTitleDisplayMode(.inline) 
        }
    }
}
