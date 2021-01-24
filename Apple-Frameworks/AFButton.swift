//
//  AFButton.swift
//  Apple-Frameworks
//
//  Created by Fabien Lebon on 24/01/2021.
//

import SwiftUI

struct AFButton: View {
    
    let title: String
    let backColor: Color
    let textColor: Color
    
    var body: some View {
        Button {
            
        } label: {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .frame(width: 280, height: 50)
                .background(backColor)
                .foregroundColor(textColor)
                .cornerRadius(10)
        }
    }
}

struct AFButton_Previews: PreviewProvider {
    static var previews: some View {
        AFButton(title: "test", backColor: Color.red, textColor: .white)
    }
}
