//
//  FontStyle.swift
//  LostAndfound
//
//  Created by Deka Primatio on 21/07/23.
//

import SwiftUI

//MARK: - TITLE & DIALOGUE STYLE MODIFIER
struct HeaderModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .fontWeight(.semibold)
            .font(.headline)
    }
}

extension View {
    func headerStyle() -> some View {
        modifier(HeaderModifier())
    }
}

//MARK: - DESCRIPTION, TUTORIAL, & LIST OF SOUND STYLE MODIFIER
struct DescriptionModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14))
            .multilineTextAlignment(.center)
    }
}

extension View {
    func descriptionStyle() -> some View {
        modifier(DescriptionModifier())
    }
}

//MARK: - YOGA TUTORIAL NUMBER
struct FormTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 17))
    }
}

extension View {
    func formTextStyle() -> some View {
        modifier(FormTextModifier())
    }
}

struct FontStyle: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("TITLE & DIALOGUE STYLE MODIFIER")
                .headerStyle()
            
            Text("DESCRIPTION, TUTORIAL, & LIST OF SOUND STYLE MODIFIER")
                .descriptionStyle()
            
            Text("YOGA TUTORIAL NUMBER")
                .formTextStyle()
        }
    }
}

struct FontStyle_Previews: PreviewProvider {
    static var previews: some View {
        FontStyle()
    }
}
