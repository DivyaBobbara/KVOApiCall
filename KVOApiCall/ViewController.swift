//
//  ViewController.swift
//  KVOApiCall
//
//  Created by Naga Divya Bobbara on 17/08/22.
//

import UIKit
import Alamofire
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    let viewModel = GetPostsViewModel()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        AF.request("http://stagetao.gcf.education:3000/api/v1/posts/3", method: .get, parameters: nil, headers: nil).responseDecodable(of:GetPosts.self) { response in
//            print(response.value)
//        }
        
        viewModel.userList.bind { _ in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        viewModel.apiCall()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userList.value?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        
        cell.textLabel?.text = viewModel.userList.value?[indexPath.row].userName
        return cell
    }
}


