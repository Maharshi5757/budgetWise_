import SwiftUI

struct HomePage: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var categories = [
        BudgetCategory(name: "Food", iconName: "fork.knife", color: Color(red: 33/255, green: 59/255, blue: 128/255), spent: 10, budget: 100),
        BudgetCategory(name: "Shopping", iconName: "cart", color: Color(red: 56/255, green: 107/255, blue: 188/255), spent: 50, budget: 100),
        BudgetCategory(name: "Transportation", iconName: "car", color: Color(red: 255/255, green: 185/255, blue: 0/255), spent: 20, budget: 100),
        BudgetCategory(name: "Education", iconName: "book", color: Color(red: 70/255, green: 189/255, blue: 198/255), spent: 40, budget: 100),
        BudgetCategory(name: "Groceries", iconName: "basket", color: Color(red: 0/255, green: 188/255, blue: 56/255), spent: 130, budget: 200),
        BudgetCategory(name: "Housing", iconName: "house.fill", color: Color(red: 255/255, green: 55/255, blue: 60/255), spent: 5654, budget: 5654)
    ]
    @State private var showingAddCategory = false
    @State private var showingActionSheet = false
    @State private var showingAddTransaction = false
    @State private var selectedTab = "Home"
    @State private var showAllCategories = false

    var totalSpent: Double {
        categories.reduce(0) { $0 + $1.spent }
    }

    var totalBudget: Double {
        categories.reduce(0) { $0 + $1.budget }
    }

    var body: some View {
        NavigationView {
            ZStack {
                Color(uiColor: .systemBackground).ignoresSafeArea()

                ScrollView {
                    ZStack(alignment: .top) {
                        BottomRoundedRectangle(radius: 10)
                            .fill(Color(red: 82/255, green: 130/255, blue: 226/255))
                            .frame(height: 200)
                            .offset(y: -90)
                            .ignoresSafeArea(edges: .top)

                        VStack(spacing: 0) {
                            headerView

                            VStack(spacing: 0) {
                                VStack {
                                    Text("$\(totalBudget - totalSpent, specifier: "%.0f")")
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(uiColor: .systemGreen))
                                        .padding(.top, 10)

                                    Text("Remaining in Budget")
                                        .font(.subheadline)
                                        .padding(.bottom, 10)

                                    ProgressBar(value: Float(totalSpent / totalBudget))
                                        .frame(height: 20)
                                        .padding(.horizontal)
                                        .scaleEffect(x: 1, y: 2, anchor: .center)

                                    HStack {
                                        Text("Spent:")
                                            .font(.caption)
                                            .padding(.horizontal, -3)
                                        Text("$\(totalSpent, specifier: "%.0f")")
                                            .fontWeight(.bold)
                                            .font(.system(size: 19))

                                        Spacer()

                                        Text("Budget:")
                                            .font(.caption)
                                            .padding(.horizontal, -3)
                                        Text("$\(totalBudget, specifier: "%.0f")")
                                            .fontWeight(.bold)
                                            .font(.system(size: 19))
                                    }
                                    .padding(.vertical, 20)
                                    
                                    Divider()
                                        .background(Color.gray.opacity(0.3))
                                }
                                .padding(.horizontal)
                                .background(Color(uiColor: .secondarySystemBackground))
                                .padding(.horizontal)

                                VStack(spacing: 0) {
                                    ForEach(showAllCategories ? categories : Array(categories.prefix(5))) { category in
                                        CategoryRow(category: category)
                                            .padding(.horizontal)
                                    }

                                    if categories.count > 3 {
                                        Button(action: {
                                            withAnimation {
                                                showAllCategories.toggle()
                                            }
                                        }) {
                                            HStack {
                                                Spacer()
                                                Text(showAllCategories ? "Show less" : "Show more")
                                                    .foregroundColor(Color(uiColor: .systemBlue))
                                                Image(systemName: showAllCategories ? "chevron.up" : "chevron.down")
                                                    .foregroundColor(Color(uiColor: .systemBlue))
                                                Spacer()
                                            }
                                            .padding(.vertical, 10)
                                        }
                                    }
                                }
                                .background(Color(uiColor: .secondarySystemBackground))
                                .padding(.horizontal)
                            }
                            .offset(y: 5)
                            .padding(.bottom, 100)
                        }
                    }
                }

                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            showingActionSheet = true
                        }) {
                            ZStack {
                                ZStack {
                                    Circle()
                                        .trim(from: 0.0, to: 0.12)
                                        .stroke(Color(red: 33/255, green: 59/255, blue: 128/255), lineWidth: 4)
                                        .frame(width: 60, height: 70)
                                        .rotationEffect(.degrees(45))

                                    Circle()
                                        .trim(from: 0.12, to: 0.3)
                                        .stroke(Color(red: 255/255, green: 185/255, blue: 0/255), lineWidth: 4)
                                        .frame(width: 60, height: 70)
                                        .rotationEffect(.degrees(45))

                                    Circle()
                                        .trim(from: 0.3, to: 0.6)
                                        .stroke(Color.blue, lineWidth: 4)
                                        .frame(width: 60, height: 70)
                                        .rotationEffect(.degrees(45))

                                    Circle()
                                        .trim(from: 0.6, to: 0.85)
                                        .stroke(Color(red: 0/255, green: 188/255, blue: 56/255), lineWidth: 4)
                                        .frame(width: 60, height: 70)
                                        .rotationEffect(.degrees(45))

                                    Circle()
                                        .trim(from: 0.85, to: 1)
                                        .stroke(Color(red: 255/255, green: 55/255, blue: 60/255), lineWidth: 4)
                                        .frame(width: 60, height: 70)
                                        .rotationEffect(.degrees(45))
                                }

                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 50, height: 50)
                                    .shadow(radius: 5)

                                Image(systemName: "plus")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.black)
                            }
                        }
                        .actionSheet(isPresented: $showingActionSheet) {
                            ActionSheet(
                                title: Text("Add New"),
                                message: Text("Choose what you want to add"),
                                buttons: [
                                    .default(Text("Add Transaction")) {
                                        showingAddTransaction = true
                                    },
                                    .default(Text("Add Category")) {
                                        showingAddCategory = true
                                    },
                                    .cancel()
                                ]
                            )
                        }
                        .padding(.trailing, 25)
                        .padding(.bottom, 70)
                    }
                }

                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        TabBarItem(iconName: "house.fill", label: "Home", isSelected: selectedTab == "Home", selectedColor: Color(uiColor: .systemBlue))
                            .onTapGesture {
                                selectedTab = "Home"
                            }
                        Spacer()
                        TabBarItem(iconName: "chart.bar.fill", label: "Trends", isSelected: selectedTab == "Trends", selectedColor: Color(uiColor: .systemGreen))
                            .onTapGesture {
                                selectedTab = "Trends"
                            }
                        Spacer()
                        TabBarItem(iconName: "dollarsign.circle.fill", label: "Transactions", isSelected: selectedTab == "Transactions", selectedColor: Color(uiColor: .systemPurple))
                            .onTapGesture {
                                selectedTab = "Transactions"
                            }
                        Spacer()
                        TabBarItem(iconName: "message.fill", label: "Community", isSelected: selectedTab == "Community", selectedColor:Color(uiColor: .systemYellow))
                            .onTapGesture {
                                selectedTab = "Community"
                            }
                        Spacer()
                        TabBarItem(iconName: "person.circle.fill", label: "Profile", isSelected: selectedTab == "Profile", selectedColor: Color(uiColor: .systemGray))
                            .onTapGesture {
                                selectedTab = "Profile"
                            }
                        Spacer()
                    }
                    .padding(.vertical, 0)
                    .background(Color(uiColor: .systemBackground))
                }
            }
            .navigationBarHidden(true)
        }
        .sheet(isPresented: $showingAddTransaction) {
            AddTransactionView(categories: $categories)
        }
        .sheet(isPresented: $showingAddCategory) {
            AddCategoryView(categories: $categories)
        }
    }

    private var headerView: some View {
        HStack {
            Image(systemName: "line.horizontal.3")
                .foregroundColor(Color(uiColor: .white))
            Spacer()
            Text("April 2022")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(Color(uiColor: .white))
            Image(systemName: "chevron.down")
                .foregroundColor(Color(uiColor: .white))
            Spacer()
            HStack(spacing: 20) {
                Image(systemName: "square.and.arrow.up")
                    .foregroundColor(Color(uiColor: .white))
                Image(systemName: "ellipsis")
                    .foregroundColor(Color(uiColor: .white))
            }
        }
        .padding(.top)
        .padding(.horizontal,20)
        .foregroundColor(.white)
    }
}
struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
                    HomePage()
                    HomePage()
                        .preferredColorScheme(.dark)
                }
    }
}
