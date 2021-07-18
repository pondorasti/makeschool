//
//  SourceViewController.swift
//  FinalAssessmentMOB1.3
//
//  Created by Thomas Vandegriff on 3/4/19.
//  Copyright © 2019 Make School. All rights reserved.
//

import UIKit

class SourceViewController: UITableViewController {
    
    var sources: [SourceItem] = []
    
    //TODO: Part 1 - Insert proper strings into API variables for URLComponent properties)
    private let urlScheme = ""
    private let baseURLString = ""
    private let sourcesEndpoint = ""
    
    // For JSON Decoding - a Response object that conforms to Codable with SourceItem array as .source property
    private struct Response: Codable {
        let sources: [SourceItem]?
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call function to fetch all Sources from API...
        fetchSources()
    }

    
    //MARK: UITableViewDataSource delegate functions
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sources.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsFeedCell", for: indexPath) as! NewsFeedCell

        cell.sourceItem = sources[indexPath.row]
        return cell
    }
    
    
    //MARK: URLSession functions
    
    // Function that fetches all Source items from newsapi.org...
    func fetchSources() {
        //TODO: Part 2 - Start dataTask here...
        //Set up URLSession, URL, and URLRequest
        let session = URLSession(configuration: .default)
        guard let url = URL(string: self.urlBuilder()!) else { return }
        let urlRequest = URLRequest(url: url)

        //Start data task

    }

    // Function for validating response data exists or presenting HTTP error
    private func processSourcesFetchRequest(data: Data?, error: Error?) {

        // if data passed is nil, print error
        guard let jsonData = data else {
            print(error!)
            return
        }
        self.decodeSourceItems(fromJSON: jsonData)
    }

    // Function for decoding fetches all Source items from newsapi.org...
    func decodeSourceItems(fromJSON data: Data) {

        do {
            
            //TODO: Part 3 - JSONDecode JSON data object
         
            
            //TODO: Part 3 - Return to the main queue to (a) populate self.sources array, then (b) display  results in the table view...
            
        } catch let jsonError {
            
            print("error trying to convert data to JSON")
            print(jsonError)
        }
    }
    
    private func urlBuilder() -> String? {

        var components = URLComponents()
        components.scheme = urlScheme
        components.host = baseURLString
        components.path = sourcesEndpoint
        
        if let urlAsString = components.url?.absoluteString {
            let percentDecodedURL = urlAsString.decodeUrl()
            return percentDecodedURL
        } else {
            return "Invalid URL"
        }
    }
}

extension String
{
    func encodeUrl() -> String?
    {
        return self.addingPercentEncoding( withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
    }
    func decodeUrl() -> String?
    {
        return self.removingPercentEncoding
    }
}
    

