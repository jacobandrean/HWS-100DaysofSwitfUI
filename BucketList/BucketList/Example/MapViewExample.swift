//
//  MapViewExample.swift
//  BucketList
//
//  Created by Jacob Andrean on 15/08/21.
//

import MapKit
import SwiftUI

struct MapViewContentView: View {
    var body: some View {
        MapViewExample()
            .edgesIgnoringSafeArea(.all)
    }
}

struct MapViewExample: UIViewRepresentable {
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapViewExample
        
        init(_ parent: MapViewExample) {
            self.parent = parent
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            print(mapView.centerCoordinate)
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: nil)
            view.canShowCallout = true
            return view
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        let annotation = MKPointAnnotation()
        annotation.title = "London"
        annotation.subtitle = "Capital of England"
        annotation.coordinate = CLLocationCoordinate2D(latitude: 51.5, longitude: 0.13)
        
        mapView.addAnnotation(annotation)
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
}

struct MapViewContentView_Previews: PreviewProvider {
    static var previews: some View {
        MapViewExample()
    }
}
