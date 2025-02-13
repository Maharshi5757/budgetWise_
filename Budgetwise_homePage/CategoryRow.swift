import SwiftUI
struct CategoryRow: View {
    let category: BudgetCategory
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Image(systemName: category.iconName)
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .padding(10)
                                    .background(category.color)
                                    .foregroundColor(.white)
                                    .clipShape(Circle())
                                    .padding(.horizontal,1)

                
                Text(category.name)
                    .fontWeight(.bold)
                    .font(.system(size: 17))
                Spacer()
                
                VStack(alignment: .trailing, spacing: 2) {
                    Text("$\(category.spent, specifier: "%.0f")")
                        .foregroundColor(.green)
                    + Text(" of $\(category.budget, specifier: "%.0f")")
                        .foregroundColor(.primary)
                    
                    let remaining = category.budget - category.spent
                    Text("$\(remaining, specifier: "%.0f") left")
                        .foregroundColor(.secondary)
                    
                }
                .padding(.horizontal)
            }
            
            VStack {
                ProgressView(value: category.spent, total: category.budget)
                    .tint(category.color)
                    .scaleEffect(x: 1, y: 2, anchor: .center)
                    .padding(.top, 4)
                
                Spacer(minLength: 10)
            }
            
            .padding(.vertical, 8)
        }
    }
}
