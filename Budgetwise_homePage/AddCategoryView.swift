import SwiftUI

struct AddCategoryView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var categories: [BudgetCategory]
    
    @State private var categoryName = ""
    @State private var selectedIcon = "cart"
    @State private var selectedColor = Color.blue
    @State private var budget: String = ""
    
    let icons = ["food_icon","shopping_icon","transportation_icon","housing_icon","gift_icon","travel_icon","healthcare_icon","entertainment_icon","education_icon","income_icon","insurance_icon","office_icon","pet_icon","childcare_icon","transfer_icon","transfer_out_icon","transfer_in_icon","donation_icon","groceries_icon","loans_icon","miscellaneous_icon","home_improvement_icon","bank_fees_icon","saving_icon","subscription_icon","utilities_icon","personal_icon","uncategorized_icon"]
    
    let colors: [Color] = [
        Color(red: 33/255, green: 59/255, blue: 128/255),
        Color(red: 56/255, green: 107/255, blue: 188/255),
        Color(red: 255/255, green: 185/255, blue: 0/255),
        Color(red: 70/255, green: 189/255, blue: 198/255),
        Color(red: 0/255, green: 188/255, blue: 56/255),
        Color(red: 255/255, green: 55/255, blue: 60/255)
    ]
    
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
                                .font(.title2)
                                .frame(width: 50, height: 50)
                                .background(selectedIcon == icon ? selectedColor.opacity(0.2) : Color.clear)
                                .cornerRadius(10)
                                .onTapGesture {
                                    selectedIcon = icon
                                }
                        }
                    }
                    .padding(.vertical)
                }
                
                Section(header: Text("Select Color")) {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 6), spacing: 15) {
                        ForEach(colors, id: \.self) { color in
                            Circle()
                                .fill(color)
                                .frame(width: 40, height: 40)
                                .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth: selectedColor == color ? 3 : 0)
                                )
                                .onTapGesture {
                                    selectedColor = color
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
                color: selectedColor,
                spent: 0,
                budget: budgetAmount
            )
            categories.append(newCategory)
            dismiss()
        }
    }
}
