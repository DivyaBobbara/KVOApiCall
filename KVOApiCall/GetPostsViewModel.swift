//
//  Service.swift
//  KVOApiCall
//
//  Created by Naga Divya Bobbara on 17/08/22.
//

import Foundation
import Alamofire
struct GetPostsViewModel{
    let userList : Observable<[TableViewCellViewModel]> = Observable([])
    func apiCall(){
        AF.request("http://stagetao.gcf.education:3000/api/v1/posts/3", method: .get, parameters: nil, headers: nil).responseDecodable(of:GetPosts.self) { response in
//                   print(response.value)
            userList.value = response.value?.data?.compactMap({
                TableViewCellViewModel(userName: $0.userName ?? "")
            })
            
               }
    }
}

