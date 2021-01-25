//
//  GameDetailImageViewController.swift
//  iOSCarePlus
//
//  Created by Yoojin Park on 2021/01/20.
//

import UIKit
import Kingfisher

class GameDetailImageViewController: UIViewController {
    @IBOutlet private weak var imageView: UIImageView!
    
    var url: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let stringUrl = url else { return }
        let url = URL(string: stringUrl)
        imageView.kf.setImage(with: url)
    }
}
