import SwiftUI

struct AddCategoryView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var categories: [BudgetCategory]
    
    @State private var categoryName = ""
    @State private var selectedIcon = "cart"
    @State private var budget: String = ""
    
    let icons = ["food_icon","shopping_icon","transportation_icon","housing_icon","gift_icon","travel_icon","healthcare_icon","entertainment_icon","education_icon","income_icon","insurance_icon","office_icon","pets_icon","childcare_icon","transfer_out_icon","transfer_in_icon","donation_icon","groceries_icon","loans_icon","miscellaneous_icon","home_improvement_icon","bank_fees_icon","savings_icon","subscriptions_icon","utilities_icon","personal_icon"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Category Details")) {
                    TextField("Category Name", text: $categoryName)
                    
                    TextField("Budget Amount", text: $budget)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Select Icon")) {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 5), spacing: 15) {
                        ForEach(icons, id: \.self) { icon in
                            Image(icon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .padding(10)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(selectedIcon == icon ? Color.blue.opacity(0.2) : Color(uiColor: .secondarySystemBackground))
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(selectedIcon == icon ? Color.blue : Color.clear, lineWidth: 2)
                                )
                                .onTapGesture {
                                    selectedIcon = icon
                                }
                        }
                    }
                    .padding(.vertical)
                }
            }
            .navigationTitle("Add Category")
            .navigationBarItems(
                leading: Button("Cancel") {
                    dismiss()
                },
                trailing: Button("Save") {
                    saveCategory()
                }
                .disabled(categoryName.isEmpty || budget.isEmpty)
            )
        }
    }
    
    private func saveCategory() {
        if let budgetAmount = Double(budget) {
            let newCategory = BudgetCategory(
                name: categoryName,
                iconName: selectedIcon,
                spent: 0,
                budget: budgetAmount
            )
            categories.append(newCategory)
            dismiss()
        }
    }
}
