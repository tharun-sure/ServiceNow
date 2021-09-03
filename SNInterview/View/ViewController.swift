//
//  ViewController.swift
//  SNInterview
//
//  Copyright © 2019 ServiceNow. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
        
    private var coffeeShopViewModel = CoffeeShopViewModel()
    private var reviews: [CoffeeShop] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "CoffeeShopItemCell", bundle: nil), forCellReuseIdentifier: "CoffeeShopItemCell")
        
        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    func getData() {
        reviews = coffeeShopViewModel.getData()
    }
    
    //MARK: Table View
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        reviews.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeShopItemCell", for: indexPath) as? CoffeeShopItemCell else { return UITableViewCell() }
        cell.nameLabel.text = reviews[indexPath.row].name
        cell.ratingLabel.text = "Rating: \(Int(reviews[indexPath.row].rating))"
        cell.layoutIfNeeded()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle:nil)
        let reviewViewController = storyBoard.instantiateViewController(withIdentifier: "ReviewViewController") as! ReviewViewController
        if  let indexPath = tableView.indexPathForSelectedRow?.row {
            reviewViewController.reviewLabelString = reviews[indexPath].review
        }
        
        self.navigationController?.pushViewController(reviewViewController, animated: true)
    }
}
