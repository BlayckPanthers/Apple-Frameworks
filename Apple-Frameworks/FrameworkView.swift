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
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: columns) {
                    ForEach(MockData.frameworks) { framework in
                        FrameworkTitleView(framework: framework)
                            .onTapGesture {
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

struct FrameworkTitleView: View {
    
    let framework: Framework
    
    var body: some View {
        VStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 90, height: 90)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.5)
        }
        .padding()
    }
}
