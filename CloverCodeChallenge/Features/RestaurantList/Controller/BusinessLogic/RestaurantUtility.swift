//
//  RestaurantUtility.swift
//  CloverCodeChallenge
//
//  Created by Daniel Spady on 2021-03-02.
//

import Foundation

class RestaurantUtillity: BaseService {
    /**
     Retrieve list of Restaurants
     
     
     - parameter request: RestaurantRequest
     - parameter dispatchQueue: The queue used to execute the completionHandler. If nil, the completionHandler will execute on the same queue as the request. The default queue is the BaseService dispatchQueue
     - parameter completionHandler: (RestaurantResponse) -> ()
     - returns: URLSessionDataTask?
     
     */
    @discardableResult static public func restaurantList(_ request: BaseRequest = BaseRequest(), dispatchQueue: DispatchQueue? = BaseService.dispatchQueue, completionHandler: @escaping (RestaurantResponse) -> Void) -> URLSessionDataTask? {
        
        var task: URLSessionDataTask?

        task = makeGetRequest(with: request, completeOn: dispatchQueue) { (data, response, error) in
                        
            let response = RestaurantResponse(request: request,
                                                     task: task,
                                                     data: data,
                                                     response: response as? HTTPURLResponse,
                                                     error: error,
                                                     result: RestaurantResult.fromJSON(data))
            
            completionHandler(response)
        }

        task?.resume()

        return task
    }
}
