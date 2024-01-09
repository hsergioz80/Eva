//
//  PUInfo.swift
//  Eva
//
//  Created by sergio hernandez on 1/7/24.
//

import SwiftUI

struct PUInfo: View {
    var body: some View {
        NavigationView {
                    VStack {
                        NavigationLink(destination: Services()) {
                            Text("Show Detail View")
                        }.navigationBarTitle("PUInfo")
                    }
                }
    }
}

#Preview {
    PUInfo()
}
