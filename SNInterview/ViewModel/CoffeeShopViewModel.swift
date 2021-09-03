//
//  CoffeeShopViewModel.swift
//  SNInterview
//
//  Created by Tharun Sure on 9/2/21.
//  Copyright © 2021 ServiceNow. All rights reserved.
//

import UIKit

class CoffeeShopViewModel: NSObject {
    
    func getData() -> [CoffeeShop] {
        let decoder = JSONDecoder()
        
        if let path = Bundle.main.path(forResource: "CoffeeShops", ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let coffeeShopJSONResult = try decoder.decode([CoffeeShop].self, from: data)
                
                return coffeeShopJSONResult
              } catch {
                   print(error)
              }
        }
        
        return []
    }
}
