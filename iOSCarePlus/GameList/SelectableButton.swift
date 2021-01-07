//
//  SelectableButton.swift
//  iOSCarePlus
//
//  Created by Yoojin Park on 2021/01/06.
//

import UIKit

class SelectableButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setTitleColor(UIColor.init(named: "black"), for: .selected)
        setTitleColor(UIColor.init(named: "VeryLightPink"), for: .normal)
        tintColor = .clear
    }
//    func select(_ value: Bool) {
//        if value {
//            setTitleColor(UIColor.init(named: "black"), for: .normal)
//        } else {
//            setTitleColor(UIColor.init(named: "VeryLightPink"), for: .normal)
//        }
//    }
}
