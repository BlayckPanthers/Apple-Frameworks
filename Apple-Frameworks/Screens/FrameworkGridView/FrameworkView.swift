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
            ScrollView{
                LazyVGrid(columns: viewModel.columns) {
                    ForEach(MockData.frameworks) { framework in
                        FrameworkTitleView(framework: framework)
                            .onTapGesture {
                                // selectedFramework didSet set viewModel.isShowingDetailView to true
                                viewModel.selectedFramework = framework
                            }
                    }
                }
            }.navigationTitle("🍎 Frameworks")
            .sheet(isPresented: $viewModel.isShowingDetailView, content: {
                DetailFrameworkView(framework: viewModel.selectedFramework ?? MockData.standeloneFramework, isShowingDetailView: $viewModel.isShowingDetailView)
            })
        }
        
    }
}

struct FrameworkView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkView()
            .preferredColorScheme(.dark)
    }
}

