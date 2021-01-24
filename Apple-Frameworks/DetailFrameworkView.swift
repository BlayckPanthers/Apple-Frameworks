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
    
    var body: some View {
        VStack() {
            
            HStack {
                Spacer()
                Button {
                    isShowingDetailView = false
                } label: {
                    //Color.label -> white in darkmode, black in whitemode
                    Image(systemName: "xmark")
                        .foregroundColor(Color(.label))
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                }
            }.padding()
            
            Spacer()
            FrameworkTitleView(framework: framework)
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            AFButton(title: "Learn more", backColor: .red, textColor: .white)
            
        }
    }
}

struct DetailFrameworkView_Previews: PreviewProvider {
    static var previews: some View {
        DetailFrameworkView(framework: MockData.standeloneFramework, isShowingDetailView: .constant(false))
            .preferredColorScheme(.dark)
    }
}
