//
//  DetailFrameworkView.swift
//  Apple-Frameworks
//
//  Created by Fabien Lebon on 24/01/2021.
//

import SwiftUI

struct DetailFrameworkView: View {
    
    let framework: Framework
    
    // Binding makes isShowingdetailView to the same value to the parent view
    @Binding var isShowingDetailView: Bool
    
    @State private var isShowingSafariView = false
    
    var body: some View {
        VStack() {
            FrameworkTitleView(framework: framework)
            
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button {
                isShowingSafariView = true
            } label : {
                AFButton(title: "Learn more", backColor: .red, textColor: .white)
            }
            
            
        }
        .fullScreenCover(isPresented: $isShowingSafariView, content: {
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
                .edgesIgnoringSafeArea(.all)
        })
    }
}

struct DetailFrameworkView_Previews: PreviewProvider {
    static var previews: some View {
        DetailFrameworkView(framework: MockData.standeloneFramework, isShowingDetailView: .constant(false))
            .preferredColorScheme(.dark)
    }
}
