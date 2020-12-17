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
    let getNewGameListURL: String = "https://ec.nintendo.com/api/KR/ko/search/new?count=30&offset=0"
//    let getGamePriceURL = "https://api.ec.nintendo.com/v1/price"
    var model: NewGameResponse? {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newGameListAPICall()
    }
    
    private func newGameListAPICall() {
        AF.request(getNewGameListURL).responseJSON { [weak self] response in
            guard let data = response.data else { return }
            
            let decoder: JSONDecoder = JSONDecoder()
            let model: NewGameResponse? = try? decoder.decode(NewGameResponse.self, from: data) // 타입이나 형태를 넣을 때는 self를 뒤에 붙여야함
            self?.model = model
        }
    }
}
extension GameListViewController: UITableViewDelegate {
}

extension GameListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model?.contents.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let content = model?.contents[indexPath.row] else { return UITableViewCell() }
        
        let cell: GameItemTableViewCell = tableView.dequeueReusableCell(withIdentifier: "GameItemTableViewCell", for: indexPath) as! GameItemTableViewCell
        
        let model: GameItemModel = GameItemModel(gameTitle: content.formalName, gameOriginPrice: 10_000, gameDiscountPrice: nil, imageURL: content.heroBannerURL)
        
        cell.setModel(model)
        return cell
    }
}
