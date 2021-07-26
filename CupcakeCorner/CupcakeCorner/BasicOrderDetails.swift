//
//  BasicOrderDetails.swift
//  CupcakeCorner
//
//  Created by Jacob Andrean on 26/07/21.
//

import SwiftUI

struct BasicOrderDetails: View {
    @ObservedObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.orderViewModel.type) {
                        ForEach(0..<Order.types.count) {
                            Text(Order.types[$0])
                        }
                    }
                    Stepper(value: $order.orderViewModel.quantity, in: 3...20) {
                        Text("Number of cakes: \(order.orderViewModel.quantity)")
                    }
                }
                
                Section {
                    Toggle(isOn: $order.specialRequestEnabled.animation()) {
                        Text("Any special requests?")
                    }
                    
                    if order.specialRequestEnabled {
                        Toggle(isOn: $order.orderViewModel.extraFrosting, label: {
                            Text("Add extra frosting")
                        })
                        
                        Toggle(isOn: $order.orderViewModel.addSpringkles, label: {
                            Text("Add extra springkles")
                        })
                    }
                }
                
                Section {
                    NavigationLink(destination: AddressView(order: order)) {
                        Text("Delivery details")
                    }
                }
            }
            .navigationBarTitle("Cupcake Corner")
        }
    }
}

/*
 struct BasicOrderDetails: View {
     @ObservedObject var order = Order()
     
     var body: some View {
         NavigationView {
             Form {
                 Section {
                     Picker("Select your cake type", selection: $order.type) {
                         ForEach(0..<Order.types.count) {
                             Text(Order.types[$0])
                         }
                     }
                     Stepper(value: $order.quantity, in: 3...20) {
                         Text("Number of cakes: \(order.quantity)")
                     }
                 }
                 
                 Section {
                     Toggle(isOn: $order.specialRequestEnabled.animation()) {
                         Text("Any special requests?")
                     }
                     
                     if order.specialRequestEnabled {
                         Toggle(isOn: $order.extraFrosting, label: {
                             Text("Add extra frosting")
                         })
                         
                         Toggle(isOn: $order.addSpringkles, label: {
                             Text("Add extra springkles")
                         })
                     }
                 }
                 
                 Section {
                     NavigationLink(destination: AddressView(order: order)) {
                         Text("Delivery details")
                     }
                 }
             }
             .navigationBarTitle("Cupcake Corner")
         }
     }
 }
 */

struct BasicOrderDetails_Previews: PreviewProvider {
    static var previews: some View {
        BasicOrderDetails()
    }
}
