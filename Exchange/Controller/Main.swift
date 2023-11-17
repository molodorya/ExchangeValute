//
//  ViewController.swift
//  Exchange
//
//  Created by Nikita Molodorya on 03.11.2023.
//

import UIKit

class Main: UITableViewController, UITableViewDragDelegate {
   
    
    
    var infoTable: [[ValuteScreen]] = [ [], [] ]
  
    func getDate() -> String {
        let now = Date.now
        let date = now.formatted(date: .abbreviated, time: .omitted)
        
        return date.description
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = getDate().precomposedStringWithCanonicalMapping
        
        tableView.dragDelegate = self
        tableView.dragInteractionEnabled = true
        self.tableView.dataSource = self
        self.tableView.rowHeight = 70
      
        getDataFromJSON()
        
        
    }
    
    @IBAction func right(_ sender: UIBarButtonItem) {
        
      
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoTable[section].count
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ["Избранные", "Все"][section]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return infoTable.count
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = ExchangeView()
        vc.modalPresentationStyle = .overCurrentContext
        
        self.present(vc, animated: false) {
            
        }
    }
    
    
    
    
     
    
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let itemAddFavorite = UIContextualAction(style: .normal, title: "Добавить") { contextualAction, view, boolValue in
            
            
            
            self.infoTable[0] += [ValuteScreen(name: self.infoTable[indexPath.section][indexPath.row].name, ticker: self.infoTable[indexPath.section][indexPath.row].ticker, value: self.infoTable[indexPath.section][indexPath.row].value, imgURL: self.infoTable[indexPath.section][indexPath.row].imgURL)]
            
            tableView.reloadData()
         
            
        }
        
        
        let itemDelete = UIContextualAction(style: .destructive, title: "Delete") {  (contextualAction, view, boolValue) in
             
        }
        
        itemDelete.image = UIImage(named: "deleteIcon")
        
        let swipeActions = UISwipeActionsConfiguration(actions: [itemDelete, itemAddFavorite])
        
        return swipeActions
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! cellValue
        
        cell.titleValue.text = infoTable[indexPath.section][indexPath.row].name
        cell.promptValue.text = infoTable[indexPath.section][indexPath.row].ticker
        cell.priceValue.text = "\(infoTable[indexPath.section][indexPath.row].value.removeLastDouble()) ₽"
        cell.img.downloaded(from: infoTable[indexPath.section][indexPath.row].imgURL)
        
        
        return cell
    }
    
    
    func getDataFromJSON() {
        guard let url = URL(string: "https://www.cbr-xml-daily.ru/daily_json.js") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            guard error == nil else { return }
            
            do {
                let getJson = try JSONDecoder().decode(A.self, from: data)
                let json = getJson.Valute

                
              
                
                self.infoTable[1] += [ValuteScreen(name: json.AUD.Name, ticker: json.AUD.CharCode, value: json.AUD.Value, imgURL: ImgCoutries.AUD.rawValue)]
                self.infoTable[1] += [ValuteScreen(name: json.AZN.Name, ticker: json.AZN.CharCode, value: json.AZN.Value, imgURL: ImgCoutries.AZN.rawValue)]
                self.infoTable[1] += [ValuteScreen(name: json.GBP.Name, ticker: json.GBP.CharCode, value: json.GBP.Value, imgURL: ImgCoutries.GBP.rawValue)]
                self.infoTable[1] += [ValuteScreen(name: json.BGN.Name, ticker: json.BGN.CharCode, value: json.BGN.Value, imgURL: ImgCoutries.BGN.rawValue)]
                self.infoTable[1] += [ValuteScreen(name: json.BRL.Name, ticker: json.BRL.CharCode, value: json.BRL.Value, imgURL: ImgCoutries.BRL.rawValue)]
                
                self.infoTable[1] += [ValuteScreen(name: json.HUF.Name, ticker: json.HUF.CharCode, value: json.HUF.Value, imgURL: ImgCoutries.HUF.rawValue)]
                self.infoTable[1] += [ValuteScreen(name: json.VND.Name, ticker: json.VND.CharCode, value: json.VND.Value, imgURL: ImgCoutries.VND.rawValue)]
                self.infoTable[1] += [ValuteScreen(name: json.HKD.Name, ticker: json.HKD.CharCode, value: json.HKD.Value, imgURL: ImgCoutries.HKD.rawValue)]
                self.infoTable[1] += [ValuteScreen(name: json.GEL.Name, ticker: json.GEL.CharCode, value: json.GEL.Value, imgURL: ImgCoutries.GEL.rawValue)]
                self.infoTable[1] += [ValuteScreen(name: json.DKK.Name, ticker: json.DKK.CharCode, value: json.DKK.Value, imgURL: ImgCoutries.DKK.rawValue)]
                self.infoTable[1] += [ValuteScreen(name: json.AED.Name, ticker: json.AED.CharCode, value: json.AED.Value, imgURL: ImgCoutries.AED.rawValue)]
                
                self.infoTable[1] += [ValuteScreen(name: json.USD.Name, ticker: json.USD.CharCode, value: json.USD.Value, imgURL: ImgCoutries.USD.rawValue)]
                self.infoTable[1] += [ValuteScreen(name: json.EUR.Name, ticker: json.EUR.CharCode, value: json.EUR.Value, imgURL: ImgCoutries.EUR.rawValue)]
                self.infoTable[1] += [ValuteScreen(name: json.EGP.Name, ticker: json.EGP.CharCode, value: json.EGP.Value, imgURL: ImgCoutries.EGP.rawValue)]
                self.infoTable[1] += [ValuteScreen(name: json.INR.Name, ticker: json.INR.CharCode, value: json.INR.Value, imgURL: ImgCoutries.INR.rawValue)]
//                self.infoTable += [ValuteScreen(name: json.TDR.Name, ticker: json.TDR.CharCode, value: json.TDR.Value, imgURL: ImgCoutries.TDR.rawValue)]
                self.infoTable[1] += [ValuteScreen(name: json.KZT.Name, ticker: json.KZT.CharCode, value: json.KZT.Value, imgURL: ImgCoutries.KZT.rawValue)]
                
                self.infoTable[1] += [ValuteScreen(name: json.CAD.Name, ticker: json.CAD.CharCode, value: json.CAD.Value, imgURL: ImgCoutries.CAD.rawValue)]
                self.infoTable[1] += [ValuteScreen(name: json.QAR.Name, ticker: json.QAR.CharCode, value: json.QAR.Value, imgURL: ImgCoutries.QAR.rawValue)]
                self.infoTable[1] += [ValuteScreen(name: json.KGS.Name, ticker: json.KGS.CharCode, value: json.KGS.Value, imgURL: ImgCoutries.KGS.rawValue)]
                self.infoTable[1] += [ValuteScreen(name: json.CNY.Name, ticker: json.CNY.CharCode, value: json.CNY.Value, imgURL: ImgCoutries.CNY.rawValue)]
                self.infoTable[1] += [ValuteScreen(name: json.MDL.Name, ticker: json.MDL.CharCode, value: json.MDL.Value, imgURL: ImgCoutries.MDL.rawValue)]
                self.infoTable[1] += [ValuteScreen(name: json.NZD.Name, ticker: json.NZD.CharCode, value: json.NZD.Value, imgURL: ImgCoutries.NZD.rawValue)]
                
                self.infoTable[1] += [ValuteScreen(name: json.NOK.Name, ticker: json.NOK.CharCode, value: json.NOK.Value, imgURL: ImgCoutries.NOK.rawValue)]
                self.infoTable[1] += [ValuteScreen(name: json.PLN.Name, ticker: json.PLN.CharCode, value: json.PLN.Value, imgURL: ImgCoutries.PLN.rawValue)]
                self.infoTable[1] += [ValuteScreen(name: json.RON.Name, ticker: json.RON.CharCode, value: json.RON.Value, imgURL: ImgCoutries.RON.rawValue)]
//                self.infoTable += [ValuteScreen(name: json.XDR.Name, ticker: json.XDR.CharCode, value: json.XDR.Value, imgURL: ImgCoutries.XDR.rawValue)]
                self.infoTable[1] += [ValuteScreen(name: json.SGD.Name, ticker: json.SGD.CharCode, value: json.SGD.Value, imgURL: ImgCoutries.SGD.rawValue)]
                self.infoTable[1] += [ValuteScreen(name: json.TJS.Name, ticker: json.TJS.CharCode, value: json.TJS.Value, imgURL: ImgCoutries.TJS.rawValue)]
                
                self.infoTable[1] += [ValuteScreen(name: json.THB.Name, ticker: json.THB.CharCode, value: json.THB.Value, imgURL: ImgCoutries.THB.rawValue)]
                self.infoTable[1] += [ValuteScreen(name: json.TRY.Name, ticker: json.TRY.CharCode, value: json.TRY.Value, imgURL: ImgCoutries.TRY.rawValue)]
                self.infoTable[1] += [ValuteScreen(name: json.TMT.Name, ticker: json.TMT.CharCode, value: json.TMT.Value, imgURL: ImgCoutries.TMT.rawValue)]
                self.infoTable[1] += [ValuteScreen(name: json.UZS.Name, ticker: json.UZS.CharCode, value: json.UZS.Value, imgURL: ImgCoutries.UZS.rawValue)]
                self.infoTable[1] += [ValuteScreen(name: json.UAH.Name, ticker: json.UAH.CharCode, value: json.UAH.Value, imgURL: ImgCoutries.UAH.rawValue)]
                self.infoTable[1] += [ValuteScreen(name: json.CZK.Name, ticker: json.CZK.CharCode, value: json.CZK.Value, imgURL: ImgCoutries.CZK.rawValue)]
                
                self.infoTable[1] += [ValuteScreen(name: json.SEK.Name, ticker: json.SEK.CharCode, value: json.SEK.Value, imgURL: ImgCoutries.SEK.rawValue)]
                self.infoTable[1] += [ValuteScreen(name: json.CHF.Name, ticker: json.CHF.CharCode, value: json.CHF.Value, imgURL: ImgCoutries.CHF.rawValue)]
                self.infoTable[1] += [ValuteScreen(name: json.ZAR.Name, ticker: json.ZAR.CharCode, value: json.ZAR.Value, imgURL: ImgCoutries.ZAR.rawValue)]
                self.infoTable[1] += [ValuteScreen(name: json.KRW.Name, ticker: json.KRW.CharCode, value: json.KRW.Value, imgURL: ImgCoutries.KRW.rawValue)]
                self.infoTable[1] += [ValuteScreen(name: json.JPY.Name, ticker: json.JPY.CharCode, value: json.JPY.Value, imgURL: ImgCoutries.JPY.rawValue)]
//
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
             
            } catch let error {
                print(error)
            }
        }
        
        .resume()
        
    }


}
