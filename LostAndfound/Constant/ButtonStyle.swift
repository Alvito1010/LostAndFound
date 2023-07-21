//
//  ButtonStyle.swift
//  LostAndfound
//
//  Created by Deka Primatio on 21/07/23.
//

import SwiftUI

//MARK: - ACTIVE BUTTON MODIFIER
struct ActiveButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(width: 186, height: 44)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .circular)
                    .fill(Color("MRTBlue"))
            )
    }
}

extension View {
    func activeButtonStyle() -> some View {
        modifier(ActiveButtonModifier())
    }
}

//MARK: - DISABLE BUTTON MODIFIER
struct DisableButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .fontWeight(.semibold)
            .foregroundColor(Color("TextGray"))
            .frame(width: 186, height: 44)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .circular)
                    .fill(Color("ButtonGray"))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16, style: .circular)
                            .stroke(Color("TextGray").opacity(0.3), lineWidth: 1)
                    )
            )
    }
}

extension View {
    func disableButtonStyle() -> some View {
        modifier(DisableButtonModifier())
    }
}

struct ButtonStyle: View {
    var body: some View {
        VStack {
            Button {
                print("tapped")
            } label: {
                Text("Start")
                    .activeButtonStyle()
            }
            
            Button {
                print("tapped")
            } label: {
                Text("Start")
                    .disableButtonStyle()
            }
        }
    }
}

struct ButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyle()
    }
}
