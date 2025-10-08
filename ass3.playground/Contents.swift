// Simple Shopping Cart 🛍️

var cart: [String] = []   // создаём пустой массив для товаров
var running = true        // программа работает, пока не выберем "Exit"

while running {
    print("""
    \nMenu:
    1. Add item
    2. Remove item
    3. View cart
    4. Exit
    """)
    
    print("Enter your choice (1-4): ", terminator: "")
    let choice = readLine()          // читаем ввод пользователя
    
    if choice == "1" {
        print("Enter item name: ", terminator: "")
        if let item = readLine() {
            cart.append(item)
            print("✅ \(item) added to your cart.")
        }
        
    } else if choice == "2" {
        print("Enter item name to remove: ", terminator: "")
        if let item = readLine(), let index = cart.firstIndex(of: item) {
            cart.remove(at: index)
            print("🗑️ \(item) removed.")
        } else {
            print("⚠️ Item not found.")
        }
        
    } else if choice == "3" {
        if cart.isEmpty {
            print("🛒 Your cart is empty.")
        } else {
            print("🛍️ Your cart items:")
            for item in cart {
                print("- \(item)")
            }
        }
        
    } else if choice == "4" {
        print("👋 Goodbye!")
        running = false   // останавливаем цикл
        
    } else {
        print("⚠️ Invalid choice. Please enter 1–4.")
    }
}

