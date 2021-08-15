//
//  EnumSwitchingViewExample.swift
//  BucketList
//
//  Created by Jacob Andrean on 15/08/21.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        Text("Loading..")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed :(")
    }
}

struct EnumSwitchingViewExample: View {
    enum LoadingState {
        case loading, success, failed
    }
    
    var loadingState = LoadingState.loading
    
    var body: some View {
        Group {
            if loadingState == .loading {
                LoadingView()
            } else if loadingState == .success {
                SuccessView()
            } else if loadingState == .failed {
                FailedView()
            }
        }
    }
}

struct EnumSwitchingViewExample_Previews: PreviewProvider {
    static var previews: some View {
        EnumSwitchingViewExample()
    }
}
