//
//  NetworkService.swift
//  MoviesPKO
//
//  Created by Michał Krupa on 04/12/2023.
//

import Moya
import PromiseKit
import Reachability
import Foundation

final class NetworkService {
    
    lazy var reachability: Reachability? = {
        try? Reachability(hostname: API.url)
    }()
    
    func request<C: Codable, T: Moya.TargetType>(target: T) -> Promise<C> {
        
        return Promise<C> { seal in
            guard reachability?.connection != .unavailable else {
                seal.reject(NSError.noService)
                return
            }
            
            executeRequest(target).done { result in
                switch HttpResponse(statusCode: result.statusCode) {
                case .success:
                    print(String(data: result.data, encoding: .utf8)!)
                    if C.self == String.self,
                       let str = String(data: result.data, encoding: .utf8) {
                        seal.fulfill(str as! C)
                        
                    } else if let data: C = try? JSONDecoder()
                        .decode(C.self, from: result.data) {
                        seal.fulfill(data)
                        
                    } else {
                        seal.reject(NSError.dataNotAvailable)
                    }
                    
                default:
                    seal.reject(NSError.reject)
                }
            }.catch { error in
                seal.reject(error)
            }
        }
    }
    
    private func executeRequest<T: Moya.TargetType>(_ target: T) -> Promise<Response> {
        return Promise<Response> { seal in
            MoyaProvider<T>(plugins: [NetworkLoggerPlugin()])
                .request(target, completion: { response in
                    switch response {
                    case let .success(result):
                        seal.fulfill(result)
                        
                    case let .failure(error):
                        seal.reject(error)
                    }
                })
            
            /**
             
             For future test implementation
             
            #if UNITTESTS || UITESTS
            MoyaProvider<T>(stubClosure: MoyaProvider.immediatelyStub).request(target, completion: { mock in
                switch mock {
                case let .success(result):
                    seal.fulfill(result)
                default:
                    seal.reject(NSError.rejectError)
                }
            })
             
            #else
             */
        }
    }
}
