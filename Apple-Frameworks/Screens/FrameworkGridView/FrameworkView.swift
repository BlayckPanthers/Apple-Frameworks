//
//  FrameworkView.swift
//  Apple-Frameworks
//
//  Created by Fabien Lebon on 24/01/2021.
//

import SwiftUI

struct FrameworkView: View {
    
    // StateObject, keeps in memory even if destroy or render the view
    @StateObject var viewModel = FrameworkViewModel()
    
    // Sheet is listening to $viewModel.isShowingDetailView changes (thanks to published)
    var body: some View {
        NavigationView{
            
            List {
                ForEach(MockData.frameworks) { framework in
                    NavigationLink(destination:
                                    DetailFrameworkView(framework: framework,
                                    isShowingDetailView: $viewModel.isShowingDetailView)){
                        FrameworkTitleView(framework: framework)

                    }
                }
            }.navigationTitle("🍎 Frameworks")
        }
        .accentColor(Color(.label))
        
    }
}

struct FrameworkView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkView()
            .preferredColorScheme(.dark)
    }
}

