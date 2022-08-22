//
//  ViewController.swift
//  CryptoViewer
//
//  Created by Yigit Ozdamar on 22.08.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var tableView: UITableView!
    
    private var cryptoListViewModel : CryptoListViewModel!
    
    var colorArray = [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
     getData()
        
        self.colorArray = [
            UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1.0),
            UIColor(red: 200/255, green: 400/255, blue: 300/255, alpha: 1.0),
            UIColor(red: 300/255, green: 300/255, blue: 500/255, alpha: 1.0),
            UIColor(red: 400/255, green: 200/255, blue: 200/255, alpha: 1.0),
            UIColor(red: 500/255, green: 100/255, blue: 150/255, alpha: 1.0),
        ]
        
    }
    
    func getData(){
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        WebService().downloadCurrencies(url: url) { cryptos in
            if let cryptos = cryptos {
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptos)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        
        cell.cryptoText.text = cryptoViewModel.name
        cell.cryptoPrice.text = cryptoViewModel.price
        cell.backgroundColor = self.colorArray[indexPath.row % 5]
        return cell
        
    }


}

