//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Jacob Andrean on 26/07/21.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    @State private var success = false
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image("cupcakes")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                    
                    Text("Your total is $\(self.order.cost, specifier: "%.2f")")
                        .font(.title)
                    
                    Button("Place order") {
                        self.placeOrder()
                    }
                    .padding()
                }
            }
        }
        .navigationBarTitle("Check Out", displayMode: .inline)
        .alert(isPresented: $showingConfirmation) {
            Alert(title: Text(success ? "Thank you!" : "Sorry"), message: Text(confirmationMessage), dismissButton: .default(Text("Ok")))
        }
    }
    
    func placeOrder() {
        guard let encoded = try? JSONEncoder().encode(order.orderViewModel) else {
            print("Failed to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                self.confirmationMessage = error?.localizedDescription ?? "Unknown error"
                success = false
                self.showingConfirmation = true
                return
            }
            
            if let decodedOrder = try? JSONDecoder().decode(OrderModel.self, from: data) {
                self.confirmationMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes in on its way!"
                success = true
                self.showingConfirmation = true
            } else {
                print("Invalid response from server")
            }
        }.resume()
    }
}

/*
 struct CheckoutView: View {
     @ObservedObject var order: Order
     @State private var confirmationMessage = ""
     @State private var showingConfirmation = false
     @State private var success = false
     
     var body: some View {
         GeometryReader { geo in
             ScrollView {
                 VStack {
                     Image("cupcakes")
                         .resizable()
                         .scaledToFit()
                         .frame(width: geo.size.width)
                     
                     Text("Your total is $\(self.order.cost, specifier: "%.2f")")
                         .font(.title)
                     
                     Button("Place order") {
                         self.placeOrder()
                     }
                     .padding()
                 }
             }
         }
         .navigationBarTitle("Check Out", displayMode: .inline)
         .alert(isPresented: $showingConfirmation) {
             Alert(title: Text(success ? "Thank you!" : "Sorry"), message: Text(confirmationMessage), dismissButton: .default(Text("Ok")))
         }
     }
     
     func placeOrder() {
         guard let encoded = try? JSONEncoder().encode(order) else {
             print("Failed to encode order")
             return
         }
         
         let url = URL(string: "https://reqres.in/api/cupcakes")!
         var request = URLRequest(url: url)
         request.setValue("application/json", forHTTPHeaderField: "Content-Type")
         request.httpMethod = "POST"
         request.httpBody = encoded
         
         URLSession.shared.dataTask(with: request) { data, response, error in
             guard let data = data else {
                 print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                 self.confirmationMessage = error?.localizedDescription ?? "Unknown error"
                 success = false
                 self.showingConfirmation = true
                 return
             }
             
             if let decodedOrder = try? JSONDecoder().decode(Order.self, from: data) {
                 self.confirmationMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes in on its way!"
                 success = true
                 self.showingConfirmation = true
             } else {
                 print("Invalid response from server")
             }
         }.resume()
     }
 }
 */

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
