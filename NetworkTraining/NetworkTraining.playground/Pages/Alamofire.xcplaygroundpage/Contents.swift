import UIKit
import Alamofire
import PlaygroundSupport

/*:
 # Alamofire
 -> Swift로 만들어진 HTTP Networking 라이브러리
 
 * 주로 사용하는 **GET** 방식에 대해 알아 보도록 하겠습니다.
 * POST방식은 아래의 문서 참고.
 
 > [Alamofire Github](https://github.com/Alamofire/Alamofire)
 ---
 */
 
/*:
 ### Basic 사용법
 ```
 AF.request("http://요청할 주소").response { response in
   switch response.result {
   case .success(let data):
     print(data)
   case .failure(let error):
     print(error)
   }
 }
 ```
 */

/*
### 필요에 따른 파라미터를 쓰면되고, 필요없는 파라미터는 생략 가능!
AF.request(<#T##url: URLConvertible##URLConvertible#>,
           method: <#T##HTTPMethod#>,
           parameters: <#T##Parameters?#>,
           encoding: <#T##ParameterEncoding#>,
           headers: <#T##HTTPHeaders?#>,
           interceptor: <#T##RequestInterceptor?#>)
 
 */

func basicNetwork1() {

  let baseUrl = "https://api.github.com"
  let path = "/users"

  AF.request(baseUrl + path).response { response in
    switch response.result {
    case .success(let data):
      print(data)
    case .failure(let error):
      print(error)
    }
  }
}

basicNetwork1()


func basicNetwork2() {
  let baseUrl = "https://6uqljnm1pb.execute-api.ap-northeast-2.amazonaws.com/prod"
  let path = "/products"
  let parameters: Parameters = ["page" : 3]
  var headers: HTTPHeaders = [
    "Content-Type" : "application/json",
    "token" : "7a43448128eafa0f094e33e421a3158a"
  ]

  AF.request(baseUrl + path,
             method: HTTPMethod.get,
             parameters: parameters,
             headers: headers)
    .response { response in
      switch response.result {
      case .success(let data):
        print(data)
      case .failure(let error):
        print(error)
      }
  }
}

basicNetwork2()

/*:
 네트워크 통신 후 Data형식으로 response를 받게 되면 정상이다.\
 이유는 서버에서 response 데이터를 보낼 Encoding과정을 거치기 때문이다.\
 이 Data를 다시 원래의 모습으로 돌리는 과정을 Decoding이라고 한다.\
 \
 Codable을 이용해서 Decoding하는 방법에 대해 알아보도록 하겠습니다.
 */
