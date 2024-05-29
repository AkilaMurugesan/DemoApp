//
//  ViewController.swift
//  DemoApp
//
//  Created by Arun Subbu on 5/29/24.
//

import UIKit
struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
class ListViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    var posts = [Post]()
    var currentPage = 1
    let limit = 10
    var isLoading = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Fetch initial posts
        fetchPosts()
        // Do any additional setup after loading the view.
    }

    func fetchPosts() {
            guard !isLoading else { return }
            isLoading = true
            
            // Construct the URL
            print("_page=\(currentPage)&_limit=\(limit)")
            let urlString = "https://jsonplaceholder.typicode.com/posts?_page=\(currentPage)&_limit=\(limit)"
            guard let url = URL(string: urlString) else {
                print("Invalid URL")
                return
            }
            
            // Create a URLSessionDataTask
            let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                guard let self = self else { return }
                
                // Check for errors
                if let error = error {
                    print("Error fetching posts: \(error)")
                    self.isLoading = false
                    return
                }
                
                // Ensure we got a successful response
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    print("Server error")
                    self.isLoading = false
                    return
                }
                
                // Ensure we have data
                guard let data = data else {
                    print("No data received")
                    self.isLoading = false
                    return
                }
                
                // Decode the JSON data into an array of Post objects
                do {
                    let newPosts = try JSONDecoder().decode([Post].self, from: data)
                    
                    // Append new posts and update UI on the main thread
                    DispatchQueue.main.async {
                        self.posts.append(contentsOf: newPosts)
                        self.isLoading = false
                        self.tblView.reloadData()
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                    self.isLoading = false
                }
            }
            
            // Start the URLSessionDataTask
            task.resume()
        }
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ListTableViewCell = tblView.dequeueReusableCell(withIdentifier: "cell") as! ListTableViewCell
        cell.selectionStyle = .none
        cell.viewBorder.layer.cornerRadius = 10
        let post = posts[indexPath.row]
        cell.lblTitle.text = post.title
        cell.lblId.text = String(post.id)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        let dict1 = posts[(indexPath as NSIndexPath).row]
        print(dict1)
        detailViewController.id = String(dict1.id)
        detailViewController.titleValue = dict1.title
        detailViewController.bodyValue = dict1.body
        self.present(detailViewController, animated: false, completion: nil)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            // Check if the last cell is being displayed
        print(indexPath.row)
        print(posts.count - 1)
            if indexPath.row == posts.count - 1 {
                print(currentPage)
                currentPage += 1
                print(currentPage)
                fetchPosts()
            }
        }
    
}
