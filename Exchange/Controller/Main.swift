//
//  ViewController.swift
//  Exchange
//
//  Created by Nikita Molodorya on 03.11.2023.
//

import UIKit

class Main: UITableViewController {
    
    
    let a = ["1", "2", "3"]
    
  
    
    func getDate() -> String {
        let now = Date.now
        let date = now.formatted(date: .abbreviated, time: .omitted)
   
        
        return date.description
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        getDataFromJSON()
        title = getDate()
        
        self.tableView.dataSource = self
        self.tableView.rowHeight = 70
      
      
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return a.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! cellValue
        cell.titleValue.text = a[indexPath.row]
        
        return cell
    }
    
    
    func getDataFromJSON() {
        guard let url = URL(string: "https://www.cbr-xml-daily.ru/daily_json.js") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            guard error == nil else { return }
            
            do {
                let gettingJSON = try JSONDecoder().decode(A.self, from: data)
                print(gettingJSON.Valute.USD.Value)
             
            } catch let error {
                print(error)
            }
        }
        
        .resume()
        
    }


}




