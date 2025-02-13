struct Transaction: Codable, Identifiable {
    let id: String
    let amount: Double
    let category: String
    let date: String
    let description: String
}

