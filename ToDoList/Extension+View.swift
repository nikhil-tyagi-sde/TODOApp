//
//  Extension+View.swift
//  ToDoList
//
//  Created by Nikhil Tyagi on 06/02/26.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
