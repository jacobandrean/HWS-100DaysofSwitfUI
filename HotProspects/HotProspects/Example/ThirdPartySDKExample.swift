//
//  ThirdPartySDKExample.swift
//  HotProspects
//
//  Created by Jacob Andrean on 02/09/21.
//

import SamplePackage
import SwiftUI

struct ThirdPartySDKExample: View {
    let possibleNumbers = Array(1...60)
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        return strings.joined(separator: ", ")
    }
    
    var body: some View {
        Text(results)
    }
}

struct ThirdPartySDKExample_Previews: PreviewProvider {
    static var previews: some View {
        ThirdPartySDKExample()
    }
}
