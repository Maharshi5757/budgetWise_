import SwiftUI

struct BudgetCategory: Identifiable {
    let id = UUID()
    let name: String
    let iconName: String
    var spent: Double
    var budget: Double
}

