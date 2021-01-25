//
//  GameDetailViewController.swift
//  iOSCarePlus
//
//  Created by Yoojin Park on 2021/01/20.
//

import UIKit

class GameDetailViewController: UIViewController {
    @IBOutlet private weak var containerViewController: UIView!
    var model: NewGameContent?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? GameDetailPageViewController
        destination?.model = model
    }
}
