//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by Jacob Andrean on 27/07/21.
//

import SwiftUI

struct EmojiRatingView: View {
    let rating: Int16
    
    var body: some View {
        switch rating {
        case 1:
            return Text("๐ด")
        case 2:
            return Text("โน๏ธ")
        case 3:
            return Text("๐คจ")
        case 4:
            return Text("๐")
        case 5:
            return Text("๐")
        default:
            return Text("๐ด")
        }
    }
}

struct EmojiRatingView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiRatingView(rating: 3)
    }
}
