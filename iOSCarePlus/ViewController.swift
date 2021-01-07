//
//  ViewController.swift
//  iOSCarePlus
//
//  Created by Yoojin Park on 2020/12/04.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var logoView: UIView!
    @IBOutlet private weak var logoViewTopConstraint: NSLayoutConstraint!
    @IBOutlet private weak var backgroundImageViewLeadingConstraint: NSLayoutConstraint!
    
    @IBAction func logoTapAction(_ sender: Any) {
        blinkLogoAnimation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoView.layer.cornerRadius = 15
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animationSettingDefault()
        // 다른 탭에 갔다왔을 때 애니메이션이 가능하도록
        
        apperLogoViewAnimation { [weak self] in
            self?.slideBackgroundImageAnimation()
        }
    }
    
    private func animationSettingDefault() {
        logoViewTopConstraint.constant = -200
        backgroundImageViewLeadingConstraint.constant = 0
        logoView.alpha = 1
        view.layoutIfNeeded()
    }
    
    private func apperLogoViewAnimation(completion: @escaping () -> Void ) {
        UIView.animate(withDuration: 0.7,
                       delay: 1,
                       usingSpringWithDamping: 0.6,
                       initialSpringVelocity: 1,
                       options: []) { [weak self] in
            self?.logoViewTopConstraint.constant = 17
            self?.view.layoutIfNeeded()
            // 화면을 갱신하라고 해야 변화하기 때문에 쓰는 코드
        } completion: { _ in
            completion()
        }
    }
    
    private func slideBackgroundImageAnimation() {
        //curveEaseInOut : 빠르게 진입 후 빠르게 위치
        UIView.animate(withDuration: 5, delay: 0, options: [.curveEaseInOut, .repeat, .autoreverse]) { [weak self] in
            self?.backgroundImageViewLeadingConstraint.constant = -800
            self?.view.layoutIfNeeded()
        }
    }
    
    private func blinkLogoAnimation() {
        UIView.animate(withDuration: 1, delay: 0, options: [.autoreverse]) { [weak self] in
            // 히든을 하면 안되는 이유: 1과 0으로 이루어져 있어서 서서히 애니메이션이 안됨
            self?.logoView.alpha = 0
        } // 애니메이션을 쓰면 복사된 뷰가 보이는 것이다. -> 따라서 애니메이션이 작동 되고 있는 도중에는 클릭 같은 것이 먹지 않는 것을 볼 수 있다.
    }
}

