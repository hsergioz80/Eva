//
//  AnnotationItem.swift
//  Eva
//
//  Created by sergio hernandez on 1/27/24.
//
import Foundation
import SwiftUI
import CoreLocation

struct AnnotationItem: Identifiable {
    let id = UUID()
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
