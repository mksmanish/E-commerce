//
//  InfoViewController.swift
//  Register
//
//  Created by manish on 10/08/21.
//

import UIKit
import SDWebImage

class InfoViewController: UIViewController {

    @IBOutlet weak var tbllist: UITableView!
    var arrProduct = [Product]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        callApi()

        // Do any additional setup after loading the view.
    }
    
    func setUp() {
        tbllist.register(UINib(nibName: "DataCell", bundle: nil), forCellReuseIdentifier: "detailsCell")
    }
    
    func callApi() {
        
        self.startAnimating()
        HttpUility.sharedInstance.getApiData(requestUrl: URL(string: "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3")!, resultType: ProductList.self) { (Productlist) in
            if Productlist.products.count != 0 {
                self.stopAnimating()
                DispatchQueue.main.async {
                    self.arrProduct = Productlist.products
                    self.tbllist.reloadData()
                }
               
            }
            
        }
    }

}

extension InfoViewController:UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrProduct.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbllist.dequeueReusableCell(withIdentifier: "detailsCell", for: indexPath) as! detailsCell
        cell.selectionStyle = .none
        cell.lblTitle.text =  arrProduct[indexPath.row].name
        cell.lbldescription.text = arrProduct[indexPath.row].desc
        cell.lblPrice.text = "$" + String(arrProduct[indexPath.row].price)
        cell.imgPro.sd_setImage(with: URL(string: arrProduct[indexPath.row].image), completed: nil)
      //  sd_setImages(with:)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        print(position)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        let intTotalrow = tbllist.numberOfRows(inSection:indexPath.section)//first get total rows in that section by current indexPath.
        //get last last row of tablview
        if indexPath.row == intTotalrow - 1{

            // call for last display
            print("loading")
        }
    }
    
}


class detailsCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lbldescription: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var imgPro: UIImageView!
    
    
}
