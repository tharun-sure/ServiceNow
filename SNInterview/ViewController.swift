//
//  ViewController.swift
//  SNInterview
//
//  Copyright © 2019 ServiceNow. All rights reserved.
//

import UIKit

struct CoffeeShop {
    let name: String
    let review: String
    let rating: Int
}

//protocol CoffeeShopTapDelegate {
//    func didSelectItem(_ item: UIView?)
//}

class ViewController: UITableViewController {
//    var delegate: CoffeeShopTapDelegate!
        
    private let reviews = [
        CoffeeShop(name:"Lofty", review: "Knowledgeable staff, stacked menu. Trust the Ethiopian in a pour over if you know your flavors. Will be back for the rest of this menu soon.", rating: 4),
        CoffeeShop(name:"Zumbar", review: "Came to SD for school tour and heading back to the Bay Area after today's final meeting. Was drinking Starbucks the whole trip until my sis recommended this cafe to me. LOVE IT!", rating: 5),
        CoffeeShop(name:"Blue Bottle", review: "The place was empty the afternoon I came in, so I was able to quickly place an order for their version of a New Orleans cold brew. I received my drink right as my credit card order went through.", rating: 3),
        CoffeeShop(name:"Bird Rock", review: "When it comes to environment and ambience, this place is amazing! It has a cute lil look, yet looks a bit modern. It's very eye appealing and I would definitely deem Instagramable.", rating: 3),
        CoffeeShop(name:"Better Buzz Coffee", review: "This coffee shop is really cute. The decor is beautiful, food and coffee is tasty and the service is friendly and quick.", rating: 5)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "CoffeeShopItemCell", bundle: nil), forCellReuseIdentifier: "CoffeeShopItemCell")
        
//        delegate = CoffeeShopDetailsHandler()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
    }
    
//    @objc
//    func onTap(item: UIView) {
//        delegate.didSelectItem(nil)
//    }
    
    //MARK: Table View
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        reviews.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeShopItemCell", for: indexPath) as? CoffeeShopItemCell else { return UITableViewCell() }
        cell.nameLabel.text = reviews[indexPath.row].name
        cell.reviewLabel.text = reviews[indexPath.row].review
        cell.ratingLabel.text = "Rating: \(Int(reviews[indexPath.row].rating))"
        cell.layoutIfNeeded()
        return cell
    }
}

//class CoffeeShopDetailsHandler: CoffeeShopTapDelegate {
//    func didSelectItem(_ item: UIView?) {
//        let tapped = item as? CoffeeShopItemCell
//
//        // TODO: display the item's details
//        print("Item Tapped: \(tapped)")
//    }
//}
