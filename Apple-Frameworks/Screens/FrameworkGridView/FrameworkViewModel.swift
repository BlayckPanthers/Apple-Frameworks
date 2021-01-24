//
//  FrameworkViewModel.swift
//  Apple-Frameworks
//
//  Created by Fabien Lebon on 24/01/2021.
//

import SwiftUI

// ObservableOject to boradcast changes
final class FrameworkViewModel: ObservableObject {
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var selectedFramework: Framework? {
        didSet { isShowingDetailView = true }
    }
    
    // stuff to broadcast, published in front of it
    // the sheet is listenning to the isShowingDetailView
    @Published var isShowingDetailView = false
}
