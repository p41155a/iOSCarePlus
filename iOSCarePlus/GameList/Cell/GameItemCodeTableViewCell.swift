//
//  GameItemCodeTableViewCell.swift
//  iOSCarePlus
//
//  Created by Yoojin Park on 2020/12/23.
//

import UIKit

class GameItemCodeTableViewCell: UITableViewCell {
    var gameImageView: UIImageView
    var titleLabel: UILabel
    var priceLabel: UILabel
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        gameImageView = UIImageView()
        // 선언하고 그 뒤에 init 원래는 var gameImageView: UIImageView = UIImageView()이렇게 써서 신경 안썼던것
        titleLabel = UILabel()
        priceLabel = UILabel()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier) // 사용할 때 사용할 고유할 값
        
        contentView.addSubview(gameImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
        
        gameImageViewAutoLayout(gameImageView)
        labelAutoLayout(titleLabel, priceLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func gameImageViewAutoLayout(_ gameImageView: UIImageView) {
        gameImageView.translatesAutoresizingMaskIntoConstraints = false // 우리가 재설정하겠음
        
        NSLayoutConstraint.activate([
            gameImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            gameImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            gameImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            gameImageView.widthAnchor.constraint(equalToConstant: 122), // 상대적인것이 아니라 스스로 갖는 제약조건임
            gameImageView.heightAnchor.constraint(equalToConstant: 69)
        ])
        
        gameImageView.backgroundColor = .red
    }
    
    func labelAutoLayout(_ titleLabel: UILabel, _ priceLabel: UILabel) {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: gameImageView.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: gameImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(greaterThanOrEqualTo: contentView.trailingAnchor, constant: 15) // greaterThanOrEqualTo로 해주었기 때문에 글자 수에 따라 15가 넘을 수 있음
        ])
        
        titleLabel.text = "test"
    }
}
