import SwiftUI

struct BudgetCategory: Identifiable {
    let id = UUID()
    var name: String
    var iconName: String
    var color: Color
    var spent: Double
    var budget: Double
}

