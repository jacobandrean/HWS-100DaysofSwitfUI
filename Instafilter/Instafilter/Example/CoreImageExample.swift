//
//  CoreImageExample.swift
//  Instafilter
//
//  Created by Jacob Andrean on 13/08/21.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct CoreImageExample: View {
    @State private var image: Image?
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }
    
    func loadImage() {
        guard let inputImage = UIImage(named: "Example") else {
            return
        }
        let beginImage = CIImage(image: inputImage)
        
        let context = CIContext()
//        let currentFilter = CIFilter.sepiaTone()
//        let currentFilter = CIFilter.pixellate()
//        let currentFilter = CIFilter.crystallize()
        guard let currentFilter = CIFilter(name: "CITwirlDistortion") else {
            return
        }
        
//        currentFilter.inputImage = beginImage
//        currentFilter.intensity = 1
//        currentFilter.scale = 100
//        currentFilter.radius = 200
        
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        currentFilter.setValue(2000, forKey: kCIInputRadiusKey)
        currentFilter.setValue(CIVector(x: inputImage.size.width/2, y: inputImage.size.height/2), forKey: kCIInputCenterKey)
        
        guard let outputImage = currentFilter.outputImage else {
            return
        }
        
        if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgImage)
            image = Image(uiImage: uiImage)
        }
    }
}

struct CoreImageExample_Previews: PreviewProvider {
    static var previews: some View {
        CoreImageExample()
    }
}
