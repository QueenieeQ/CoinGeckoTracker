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
    
    let urlString = "https://api.coingecko.com/api/v3/exchange_rates"
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        // Do any additional setup after loading the view.
    }
//     fetch data
    func fetchData() {
        let url = URL(string: urlString)
        let defaultSession = URLSession(configuration: .default)
//         force unwrap
        let dataTask = defaultSession.dataTask(with: url!) {
            ( data: Data?,
              response: URLResponse?,
              error: Error?) in
            if( error != nil)
            {
                print(error!)
                return
            }
            
//            initialize object
            do {
                let json = try JSONDecoder().decode(Rates.self, from: data!)
                self.setPrice(currency: json.rates)
//                 completion handler
            }
            catch
            {
                print(error)
                return
            }
        }
//
        dataTask.resume()
    }
    
//   set view have different prices
    func setPrice(currency: Currency)
    {
        self.btcPrice.text = self.formatPrice(
            currency.btc
        )
        self.ethPrice.text = self.formatPrice(
            currency.eth
        )
        self.usdPrice.text = self.formatPrice(
            currency.usd
        )
        self.vndPrice.text = self.formatPrice(
            currency.vnd
        )
    }
    
//     format price function
    func formatPrice(_ price: Price) -> String {
        return String(format: "%@ %.4f", price.unit, price.value)
    }
    
//     rate object
    struct Rates: Codable {
        let rates: Currency
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

