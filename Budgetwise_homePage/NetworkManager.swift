import Foundation

class NetworkManager: ObservableObject {
    @Published var transactions: [Transaction] = []

    func fetchTransactions() {
        guard let url = URL(string: "https://backenddev-uza6jon7lq-uc.a.run.app/auth/ios/transactions?user_id=1g94AUvA19MGFxRgXW1cxhOPKx62") else {
            print("Invalid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601

            if let decodedData = try? decoder.decode([Transaction].self, from: data) {
                DispatchQueue.main.async {
                    self.transactions = decodedData
                }
            } else {
                print("Failed to decode JSON")
            }
        }

        task.resume()
    }
}

