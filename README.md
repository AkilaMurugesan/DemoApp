# DemoApp

## Description
Developed a straightforward iOS application that retrieves data from a public API endpoint and presents it in a paginated list format. However, the API response contains a substantial dataset, and each list item necessitates intensive computation to display additional details. Your objective is to optimize the application using iOS development best practices, ensuring efficient rendering and data management.

## Requirements
Xcode Version 15.0.1
Swift 5.0

## Sample Response
[
  {
    "userId": 1,
    "id": 1,
    "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
  }
]

## A short sneak peek into the project.
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
           
            // Check if the last cell is being displayed
       
            if indexPath.row == posts.count - 1 {
              
                currentPage += 1
               
                fetchPosts()
            }
   }


## Demo Video

[![Watch the video](https://i9.ytimg.com/vi_webp/ydmNyXW5fT8/mq2.webp?sqp=COS73bIG-oaymwEmCMACELQB8quKqQMa8AEB-AH-CIAC0AWKAgwIABABGFggXihlMA8=&rs=AOn4CLCm4GMabNgwgqitClgRmj3x4vEk-g)](https://youtu.be/ydmNyXW5fT8)
