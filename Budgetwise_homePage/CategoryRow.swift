import SwiftUI
struct CategoryRow: View {
    let category: BudgetCategory
    
    private func getCategoryColor() -> Color {
        switch category.iconName {
        case "food_icon":
            return Color(red: 33/255, green: 59/255, blue: 128/255)
        case "shopping_icon":
            return Color(red: 56/255, green: 107/255, blue: 188/255)
        case "transportation_icon":
            return Color(red: 255/255, green: 185/255, blue: 0/255)
        case "education_icon":
            return Color(red: 70/255, green: 189/255, blue: 198/255)
        case "groceries_icon":
            return Color(red: 0/255, green: 188/255, blue: 56/255)
        case "housing_icon":
            return Color(red: 255/255, green: 55/255, blue: 60/255)
        case "bank_fees_icon":
            return Color(red: 207/255, green: 80/255, blue: 53/255)
        case "childcare_icon":
            return Color(red: 195/255, green: 127/255, blue: 172/255)
        case "donation_icon":
            return Color(red: 218/255, green: 144/255, blue: 75/255)
        case "entertainment_icon":
            return Color(red: 255/255, green: 131/255, blue: 1/255)
        case "gift_icon":
            return Color(red: 228/255, green: 117/255, blue: 157/255)
        case "healthcare_icon":
            return Color(red: 173/255, green: 59/255, blue: 155/255)
        case "home_improvement_icon":
            return Color(red: 112/255, green: 135/255, blue: 192/255)
        case "income_icon":
            return Color(red: 8/255, green: 195/255, blue: 4/255)
        case "insurance_icon":
            return Color(red: 139/255, green: 159/255, blue: 166/255)
        case "loans_icon":
            return Color(red: 66/255, green: 88/255, blue: 70/255)
        case "miscellaneous_icon":
            return Color(red: 176/255, green: 134/255, blue: 109/255)
        case "office_icon":
            return Color(red: 0/255, green: 0/255, blue: 0/255)
        case "personal_icon":
            return Color(red: 139/255, green: 29/255, blue: 29/255)
        case "pets_icon":
            return Color(red: 120/255, green: 63/255, blue: 5/255)
        case "savings_icon":
            return Color(red: 27/255, green: 115/255, blue: 36/255)
        case "subscriptions_icon":
            return Color(red: 79/255, green: 127/255, blue: 136/255)
        case "transfer_in_icon", "transfer_out_icon":
            return Color(red: 100/255, green: 99/255, blue: 175/255)
        case "travel_icon":
            return Color(red: 142/255, green: 124/255, blue: 195/255)
        case "utilities_icon":
            return Color(red: 0/255, green: 158/255, blue: 223/255)
        default:
            return Color(red: 82/255, green: 130/255, blue: 226/255)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Image(category.iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .padding(10)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .padding(.leading, -35)
                
                Text(category.name)
                    .fontWeight(.bold)
                    .font(.system(size: 17))
                    .padding(.leading, -11)
                Spacer()
                
                VStack(alignment: .trailing, spacing: 6) {
                    Text("$\(category.spent, specifier: "%.0f")")
                        .foregroundColor(.green)
                    + Text(" of $\(category.budget, specifier: "%.0f")")
                        .foregroundColor(.primary)
                    
                    let remaining = category.budget - category.spent
                    Text("$\(remaining, specifier: "%.0f") left")
                        .foregroundColor(.secondary)
                }
                .padding(.trailing, 5)
            }
            .padding(.vertical, 8)
            
            ProgressView(value: category.spent, total: category.budget)
                .scaleEffect(x: 1, y: 2, anchor: .center)
                .padding(.horizontal, -40)
                .tint(getCategoryColor())
        }
        .padding(.vertical, 4)
    }
}
