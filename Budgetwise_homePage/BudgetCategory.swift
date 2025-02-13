import SwiftUI

struct BudgetCategory: Identifiable {
    let id = UUID()
    let name: String
    let iconName: String
    let color: Color
    var spent: Double
    var budget: Double
}

