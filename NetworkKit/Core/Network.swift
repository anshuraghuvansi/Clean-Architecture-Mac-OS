//
//  Network.swift
//  Network
//
//  Created by Anshu Raghuvansi on 22/07/19.
//  Copyright © 2019 anshuraghuvansi. All rights reserved.
//

import Foundation
import RxSwift
import Common
import Alamofire

struct APIResponse<T:Decodable>:Decodable{
    var status:Int
    var message:String
    var data:T?
}

public final class Network{
    
    private let baseUrl:String
    public static var token:String?
    private let scheduler: ConcurrentDispatchQueueScheduler
    
    init(_ baseUrl:String) {
        self.baseUrl = baseUrl
        self.scheduler = ConcurrentDispatchQueueScheduler(qos:
            DispatchQoS(qosClass: DispatchQoS.QoSClass.background,
                        relativePriority: 1))
    }
    
    func get<T:Decodable>(_ path: String, parameters: [String: Any] = [:]) -> Observable<T> {
        
        let request = self.request(baseUrl:baseUrl,path: path,
                                          method: .get, parameters: parameters)
        return request.observeOn(MainScheduler.instance)
            .subscribeOn(scheduler)
            .map { response -> T in
                
                let finalResponse = try JSONDecoder().decode(APIResponse<T>.self, from: response.1)
                
                if T.self is Success.Type{
                    return Success(status:finalResponse.status,message:finalResponse.message) as! T
                }
                else if(finalResponse.status != 0 || finalResponse.data == nil){
                    throw Failure(message:finalResponse.message)
                }
                return finalResponse.data!
        }
    }
    
    func post<T:Decodable>(_ path: String, parameters: [String: Any] = [:]) -> Observable<T> {
        
        let request = self.request(baseUrl:baseUrl,path: path,
                                          method: .post, parameters: parameters)
        return request.observeOn(MainScheduler.instance)
            .subscribeOn(scheduler)
            .map { response -> T in
                
                let finalResponse = try JSONDecoder().decode(APIResponse<T>.self, from: response.1)
                
                if T.self is Success.Type{
                    return Success(status:finalResponse.status,message:finalResponse.message) as! T
                }
                else if(finalResponse.status != 0 || finalResponse.data == nil){
                    throw Failure(message:finalResponse.message)
                }
                return finalResponse.data!
        }
    }
    
    
    func request(baseUrl url:String, path:URLConvertible, method:HTTPMethod,parameters:Parameters?)->Observable<(HTTPURLResponse, Data)>{
        
        var headers:HTTPHeaders = [:]
        
        if let accessToken = Network.token{
            headers["Authorization"] = "Bearer " + accessToken
        }
        
        //Params encoding
        var paramsEncoding:ParameterEncoding = URLEncoding.default
        if method == .post {
            paramsEncoding = JSONEncoding.default
        }
        
        let completeUrl = "\(url)/\(path)"
        
        return Observable<(HTTPURLResponse, Data)>.create { (observer) -> Disposable in
            
            
            let request = Alamofire.request(completeUrl, method: method, parameters: parameters, encoding: paramsEncoding, headers: headers).responseJSON(completionHandler: { response in
                
                if let _ = response.result.value{
                    
                    if let httpResponse = response.response,
                        let data = response.data{
                        observer.onNext((httpResponse,data))
                        observer.onCompleted()
                    }
                    else{
                        observer.onError(Failure(message: "Unowkn Error"))
                    }
                }
                else if let error = response.result.error{
                    observer.onError(error)
                }
            })
            
            return Disposables.create{
                request.cancel()
            }
        }
    }
}


