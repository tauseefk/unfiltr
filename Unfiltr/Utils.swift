//
//  Utils.swift
//  Unfiltr
//
//  Created by Md Tauseef on 12/30/20.
//
import UIKit

func printString (textContent: String) {
    print(textContent)
}

func log (_ tag: String) -> () -> Void {
    func pr() {
        print(tag)
    }
    return pr
}

func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
    let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
    let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
    let blue = CGFloat(rgbValue & 0xFF)/256.0

    return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
}
