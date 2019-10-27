//
//  MTPApi.swift
//  MTP clock
//
//  Created by Guðmundur Halldórsson on 20/10/2019.
//  Copyright © 2019 Guðmundur Halldórsson. All rights reserved.
//

import Alamofire
import SwiftSoup

final class MTPApi {
    
    static fileprivate func getPostID(from htmlText: String) throws -> String {
        // Parses the html document and returns the postID value
        let doc = try SwiftSoup.parse(htmlText)
        guard let postIDElement = try doc.select("#postId").first() else { throw StringError.unwrapFailed }
        let postID = try postIDElement.attr("value")
        
        return postID
    }
    
    static func loadPostID(onLoad: @escaping (String) -> Void) {
        AF.request("https://register.husa.mytimeplan.com")
        .responseString { response in
            do {
                guard let response = response.value else {
                    throw StringError.unwrapFailed
                }
                let postID = try MTPApi.getPostID(from: response)

                onLoad(postID)
            } catch {
                debugPrint("Failed to load postID")
                debugPrint(error)
            }
        }
    }
    
    static func generatePostID() -> String {
        return String.random(length: 10)
    }
    
    static func clockInOut(postID: String, SSN: String, onLoad: ([HistoryItem]) -> Void) {
        // Clock in or out depending on current state, returns an array with result of previous requests as well as the current one
        let parameters = ClockInOutParameters(postId: postID, SSN: SSN, unitId: -1)
        
        AF.request("https://register.husa.mytimeplan.com/register_ajax.php", parameters: parameters, encoder: URLEncodedFormParameterEncoder.default)
        .responseJSON { response in
            do {
                guard let jsonObject = response.value as? [String: String],
                        let historyProperty = jsonObject["history"] else {
                    throw StringError.unwrapFailed
                }
                let doc = try SwiftSoup.parse(historyProperty)
                let timeElements = try doc.select(".time")
                let nameElements = try doc.select(".name")
                let stateElements = try doc.select(".state")
                
                var historyItems: [HistoryItem] = []
                
                for i in 0..<timeElements.count {
                    historyItems.append(HistoryItem(
                        time: (try? timeElements[i].html()) ?? "",
                        name: (try? nameElements[i].html()) ?? "",
                        state: (try? stateElements[i].html()) ?? ""))
                }
            } catch {
                debugPrint("Failed to parse response for clock in/out request")
                debugPrint(error)
            }
        }
    }
    
}
