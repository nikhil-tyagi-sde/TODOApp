//
//  Extension+UI.swift
//  ToDoList
//
//  Created by Nikhil Tyagi on 06/02/26.
//

import Foundation
import SwiftUI

extension UIDevice {  //We shouldn't be using it if we are in Mac type environment.
    static var isIpad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad   //It this is true then it means we are dealing with Ipad Device not Iphone.
    }
    
    static var isIphone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone  //It this is true then it means we are dealing with Iphone Device not Ipad.
    }
}

