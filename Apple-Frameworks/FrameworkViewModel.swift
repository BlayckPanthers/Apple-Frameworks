//
//  FrameworkViewModel.swift
//  Apple-Frameworks
//
//  Created by Fabien Lebon on 24/01/2021.
//

import SwiftUI

final class FrameworkViewModel: ObservableObject {
    
    var selectedFramework: Framework? {
        didSet {
            isShowingDetailView = true
        }
    }
    
    
    @Published var isShowingDetailView = false
}
