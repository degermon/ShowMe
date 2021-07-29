//
//  SearchBar.swift
//  ShowMe
//
//  Created by Daniel Šuškevič on 2021-07-26.
//

import SwiftUI

struct SearchBar: View {
    
    // MARK: - PROPERTIES
    
    @Binding var text: String
    @State private var isEditing = false
    
    // MARK: - BODY
    
    var body: some View {
        HStack {
            TextField("Show me the...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(20)
                .disableAutocorrection(true)
                .shadow(radius: 6)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }, label: {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }) //: BUTTON
                        }
                    } //: HSTACK
                ) //: OVERLAY
                .padding(.horizontal, 10)
                .modifier(TransitionModifier())
                .onTapGesture {
                    self.isEditing = true
                }
            
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                    // Dismiss the keyboard
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }, label: {
                    Text("Cancel")
                }) //: BUTTON
                .padding(.trailing, 10)
                .modifier(TransitionModifier())
            }
        } //: HSTACK
    }
}

// MARK: - PREVIEW

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
