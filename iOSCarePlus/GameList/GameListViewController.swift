//
//  GameListViewController.swift
//  iOSCarePlus
//
//  Created by Yoojin Park on 2020/12/16.
//

import Alamofire
import UIKit

class GameListViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var newButton: SelectableButton!
    @IBOutlet private weak var saleButton: SelectableButton!
    @IBOutlet private weak var selectedLineCenterConstraints: NSLayoutConstraint!
    
    @IBAction private func newButtonTouchUp(_ sender: Any) {
        newButton.isSelected = true
        saleButton.isSelected = false
        
        UIView.animate(withDuration: 0.1) {[weak self] in
            self?.selectedLineCenterConstraints.constant = 0
            self?.view.layoutIfNeeded()
        }
        
        tapState = .new
    }
    @IBAction private func saleButtonTouchUp(_ sender: Any) {
        newButton.isSelected = false
        saleButton.isSelected = true
        let constant: CGFloat = saleButton.center.x - newButton.center.x
        UIView.animate(withDuration: 0.1) {[weak self] in
            self?.selectedLineCenterConstraints.constant = constant
            self?.view.layoutIfNeeded()
        }
        
        tapState = .sale
    }
    
    private var newCount: Int = 10
    private var newOffset: Int = 0
    private var isEnd: Bool = false
    private lazy var listUrl: String = "\(GameAPILink.new.URL)?count=\(newCount)&offset=\(newOffset)"
    private var tapState: GameAPILink = .new {
        didSet {
            newOffset = 0
            listUrl = "\(tapState.URL)?count=\(newCount)&offset=\(newOffset)"
            model?.contents.removeAll()
        }
    }
    
    private var model: NewGameResponse? {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.register(GameItemCodeTableViewCell.self, forCellReuseIdentifier: "GameItemCodeTableViewCell")
        newGameListAPICall()
    }
    
    private func newGameListAPICall() {
        AF.request(listUrl).responseJSON { [weak self] response in
            guard let data = response.data else { return }
            
            let decoder: JSONDecoder = JSONDecoder()
            guard let model: NewGameResponse = try? decoder.decode(NewGameResponse.self, from: data) else { // 타입이나 형태를 넣을 때는 self를 뒤에 붙여야함
                return
            }
            
            if self?.model == nil {
                self?.model = model
            } else {
                if model.contents.isEmpty {
                    self?.isEnd = true
                }
                self?.model?.contents.append(contentsOf: model.contents)
            }
        }
    }
    private func saleGameListAPICall() {
        AF.request(listUrl).responseJSON { [weak self] response in
            guard let data = response.data else { return }
            
            let decoder: JSONDecoder = JSONDecoder()
            guard let model: NewGameResponse = try? decoder.decode(NewGameResponse.self, from: data) else { // 타입이나 형태를 넣을 때는 self를 뒤에 붙여야함
                return
            }
            
            if self?.model == nil {
                self?.model = model
            } else {
                if model.contents.isEmpty {
                    self?.isEnd = true
                }
                self?.model?.contents.append(contentsOf: model.contents)
            }
        }
    }
}

extension GameListViewController: UITableViewDelegate {
}

extension GameListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let model = model else { return 0 } // 응답받기전에 셀 0개보여주도록 코드 수정
        let contentNum: Int = model.contents.count
        
        return isEnd ? contentNum : contentNum + 1
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if isIndicatorCell(indexPath) {
            newOffset += 10
            newGameListAPICall()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "GameItemCodeTableViewCell", for: indexPath)
//        return cell
        if isIndicatorCell(indexPath) {
//            newOffset += 10
//            newGameListAPICall()
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "IndicatorCell", for: indexPath) as? IndicatorCell else { return UITableViewCell() }
            cell.animationIndicatorView()
            return cell
        }
        
        guard let content = model?.contents[indexPath.row] else { return UITableViewCell() }

        let cell: GameItemTableViewCell = tableView.dequeueReusableCell(withIdentifier: "GameItemTableViewCell", for: indexPath) as! GameItemTableViewCell

        let model: GameItemModel = GameItemModel(gameTitle: content.formalName, gameOriginPrice: 10_000, gameDiscountPrice: nil, screenshots: nil, imageURL: content.heroBannerURL)
        cell.setModel(model)
        return cell
    }
    
    private func isIndicatorCell(_ indexPath: IndexPath) -> Bool {
        indexPath.row == model?.contents.count
    }
}
