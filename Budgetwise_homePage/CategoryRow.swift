import SwiftUI
struct CategoryRow: View {
    let category: BudgetCategory
    
    private func getCategoryColor() -> Color {
        switch category.name.lowercased() {
        case "food":
            return Color(red: 33/255, green: 59/255, blue: 128/255) // #213B80
        case "shopping":
            return Color(red: 56/255, green: 107/255, blue: 188/255) // #386BBC
        case "transportation":
            return Color(red: 255/255, green: 185/255, blue: 0/255) // Yellow
        case "education":
            return Color(red: 70/255, green: 189/255, blue: 198/255) // #46BDC6
        case "groceries":
            return Color(red: 0/255, green: 188/255, blue: 56/255) // Green
        case "housing":
            return Color(red: 255/255, green: 55/255, blue: 60/255) // Red
        default:
            return Color(red: 82/255, green: 130/255, blue: 226/255) // Default Blue
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
