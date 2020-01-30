
import UIKit
import Alamofire

/*:
 # 모델 만들어서 JSON 디코딩 하기
*/


print("\n--------------(문제 2)--------------\n")
/*
  1. 해당 주소로 네트워크 통신해서 데이터 가져오기
  2. login, id, avatar_url 데이터만 필요함
  3. camel_case -> lowerCase(avatar_url은 avatarUrl로 변경)
 */

func fetchUser() {
  let baseUrl = "https://api.github.com"
  let path = "/users"

}
fetchUser()


print("\n--------------(문제 3)--------------\n")
/*
  1. 해당 주소로 네트워크 통신해서 데이터 가져오기
  2. 전체 데이터가 다 필요함
  3. camel_case -> lowerCase로 변경
*/
func fetchMovies() {
  let baseUrl = "http://connect-boxoffice.run.goorm.io"
  let path = "/movies"
}
fetchMovies()


print("\n--------------(문제 4)--------------\n")
/*
  1. 해당 주소로 네트워크 통신해서 데이터 가져오기
  2. 전체 데이터가 다 필요함
  3. camel_case -> lowerCase로 변경
*/
func fetchMovie() {
  let baseUrl = "http://connect-boxoffice.run.goorm.io"
  let path = "/movie"
  let id = "5a54c286e8a71d136fb5378e"
}
fetchMovie()


print("\n--------------(문제 5)--------------\n")
/*
  1. 해당 주소로 네트워크 통신해서 데이터 가져오기
  2. 전체 데이터가 다 필요함
  3. camel_case -> lowerCase로 변경
*/
func fetchComment() {
  let baseUrl = "http://connect-boxoffice.run.goorm.io"
  let path = "/comments"
  let id = "5a54c286e8a71d136fb5378e"
}
fetchComment()
