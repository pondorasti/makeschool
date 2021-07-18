//
//  SourceViewController.swift
//  FinalAssessmentMOB1.3
//
//  Created by Thomas Vandegriff on 3/4/19.
//  Copyright © 2019 Make School. All rights reserved.
//

import UIKit

class SourceViewController: UITableViewController {
    
    //TODO: Using MVVM, refactor this datasource array 
    var sources: [SourceItem] = []
    
    private let urlScheme = "https"
    private let baseURLString = "newsapi.org/v1"
    private let sourcesEndpoint = "/sources"
    
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
        
        // Set up URLSession, URL, and URLRequest
        let session = URLSession(configuration: .default)
        guard let url = URL(string: self.urlBuilder()!) else { return }
        let urlRequest = URLRequest(url: url)

        // Execute dataTask and call
        let task = session.dataTask(with: urlRequest, completionHandler: {
            (data, response, error) -> Void in
            
            self.processSourcesFetchRequest(data: data, error: error)
        })
        task.resume()
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
            let decodedResponseObject = try JSONDecoder().decode(Response.self, from: data)
            let sourcesDataArray = decodedResponseObject.sources
            
            DispatchQueue.main.async {
                self.sources = sourcesDataArray!
                self.tableView?.reloadData()
            }
        } catch let jsonError {
            
            //if JSONDecoder fails, catch and present error
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
    

