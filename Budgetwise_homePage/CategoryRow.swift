import SwiftUI
struct CategoryRow: View {
    let category: BudgetCategory
    
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
                .tint(.green)
        }
        .padding(.vertical, 4)
    }
}
