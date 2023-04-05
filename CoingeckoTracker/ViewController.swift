//
//  ViewController.swift
//  CoingeckoTracker
//
//  Created by Quý Ninh on 06/04/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btcPrice: UILabel!
    @IBOutlet weak var ethPrice: UILabel!
    
    @IBOutlet weak var lastUpdated: UILabel!
    @IBOutlet weak var vndPrice: UILabel!
    @IBOutlet weak var usdPrice: UILabel!
    
    let urlSTring = "https://api.coingecko.com/api/v3/exchange_rates"
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        // Do any additional setup after loading the view.
    }
//     fetch data
    func fetchData() {
        let url = URL(string: urlSTring)
        let defualtSession = URLSession(configuration: .default)
        
    }
//     rate object
    struct Rate: Codable {
        let rate: Currency
    }
    
//    another object to hold all of these different prices
    struct Currency: Codable {
        let btc: Price
        let eth: Price
        let usd: Price
        let vnd: Price
    }
// model json dât and turn it into some object
    struct Price:Codable {
        let name: String
        let unit: String
        let value: Float
        let type: String
    }

}

// {
//     "rates": {
//         "btc": {
//             "name": "Bitcoin",
//             "unit": "BTC",
//             "value": 1,
//             "type": "crypto"
//         },
//         "eth": {
//             "name": "Ether",
//             "unit": "ETH",
//             "value": 14.764,
//             "type": "crypto"
//         },
//         "usd": {
//             "name": "US Dollar",
//             "unit": "$",
//             "value": 28024.913,
//             "type": "fiat"
//         },
//         "vnd": {
//             "name": "Vietnamese đồng",
//             "unit": "₫",
//             "value": 657884836.024,
//             "type": "fiat"
//         },
//     }
// }

