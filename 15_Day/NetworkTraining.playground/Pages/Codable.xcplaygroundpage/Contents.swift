
import UIKit



/*:
 ## Encoding, Decoding
 네트워크 통신 후 Data형식으로 response를 받게 되면 정상이다.\
 이유는 서버에서 response 데이터를 보낼 Encoding과정을 거치기 때문이다.\
 이 Data를 다시 원래의 모습으로 돌리는 과정을 Decoding이라고 한다.\
 \
 Codable을 이용해서 Decoding하는 방법에 대해 알아보도록 하겠습니다.
 
 ![EncodeDecode](Codable.png)

 
 switch에선 인코딩과 디코딩을 위한 프로토콜(Encodable, Decodable)을 만들어 두었다.\
 이 둘을 합쳐 놓은것을 `Codable`이라고 한다.
 */

/*:
 ### 사용법
 쉽게 생각해서, 모델에 Codable 프로토콜만 붙혀주면 끝!\
 ```
 struct 모델이름: Codable {
  
 }
 ```
 */

struct TestModel: Codable {
  
}

//-----------------------------------------------------------------------------------//
/*:
 1. 서버에서 내려온 JSON 데이터로 모델 만들기
 */

//--------------------------------------//"
//--------------예제 JSON 1--------------//"
//--------------------------------------//"

/*
  [
    {
      "age": 2,
      "name": "몽실이"
    },
    {
      "age": 1,
      "name": "대박이"
    },
    {
     "age": 6,
     "name": "백구"
    }
  ]
 */


// 서버에서 내려온 데이터를 받기 위한 모델
struct Dog: Codable {
  var age: Int
  var name: String
}

//--------------------------------------//"
//--------------예제 JSON 2--------------//"
//--------------------------------------//"
/*
 {
 "statusCode": 200,
 "body": [
   {
     "id": 536,
     "price": "19650",
     "thumbnail_image": "https://grepp-programmers-challenges.s3.ap-northeast-2.amazonaws.com/2020-birdview/thumbnail/ef792a79-435c-44eb-b9dc-285750ae1517.jpg",
     "title": "플라멜엠디 밀크러스트필 마일드 워시오프 앰플 5ml x 2개"
   },
   {
     "id": 258,
     "price": "25550",
     "thumbnail_image": "https://grepp-programmers-challenges.s3.ap-northeast-2.amazonaws.com/2020-birdview/thumbnail/2c7672aa-5112-4f28-bd43-79ee817d67bf.jpg",
     "title": "아티스트리 맨 젠틀 페이스 워시 115ml"
   }
  ]
 }
*/

// 서버에서 내려온 데이터를 받기 위한 모델
struct Products {
  var statusCode: Int
  var body: [Product1]
}

struct Product1 {
  var id: Int
  var price: String
  var thumbnail_image: String
  var title: String
}

//---------------------------------------------------------//"
//--------------서버에서 내려주는 키 값 변경 하는 방법--------------//"
//--------------------------------------------------------//"

// 자세히 보면 camel_case로 데이터가 내려온걸 볼 수 있다.
// 하지만 swift에선 camel_case보다 lowerCase를 선호합니다.
// 서버에서 내려주는 Key값을 원하는 Key로 변경이 가능합니다!

struct Product2 {
  var id: Int
  var price: String
  var thumbnail_image: String
  var name: String
  
  // Product1모델처럼 서버에서 내려주는 키값을 그대로 사용해도 된다.
  // enum CodingKeys: String, CodingKey은 생략되어있다고 보면된다.
  
  // 하지만
  // 키를 변경하려면 enum CodingKeys: String, CodingKey 를 적어줘야된다.
  
  enum CodingKeys: String, CodingKey {
    case id, price // 서버에서 내려주는 키 값을 그대로 사용하겠다.
    case thumbnailImage = "thumbnail_image" // 서버에서 내려주는 thumbnail_image키 값을 thumbnailImage로 바꿔주겠다.
    case name = "title" // 서버에서 내려주는 title키 값을 name으로 바꿔주겠다.
  }
}

//-----------------------------------------------------------------------------------//


//---------------------------------------------------------//"
//--------------모델을 만들었으니 디코딩하는 방법--------------//"
//--------------------------------------------------------//"

/*:
 ## JSONDecoder() <-> JSONEncoder()
 
 * 기본 골자
 ```
 do {
   let result = try JSONDecoder().decode(모델.self, from: jsonData)
   print(result)
 } catch {
   print("Decodable Error")
 }
 ```
 */

print("\n--------------(Array 패턴)--------------\n")
func sample1() {
  
  let jsonData = """
  [
    {
      "age": 2,
      "name": "몽실이"
    },
    {
      "age": 1,
      "name": "대박이"
    },
    {
     "age": 6,
     "name": "백구"
    }
  ]
  """.data(using: .utf8)!

  // Root 부분이 배열이기 때문에 [Dog]
  do {
    let result = try JSONDecoder().decode([Dog].self, from: jsonData)
    result.forEach { print($0) }
  } catch {
    print("Decodable Error")
  }
}

sample1()

print("\n--------------(Dictionary 패턴)--------------\n")
func sample2() {
  let jsonData = """
  {
    "message": "success",
    "number": 3,
    "people": [
      {
        "craft": null,
        "name": "Anton Shkaplerov"
      },
      {
        "craft": "ISS",
        "name": "Scott Tingle"
      },
      {
        "craft": null,
        "name": "Norishige Kanai"
      }
    ]
  }
  """.data(using: .utf8)!
  
  do {
    let result = try JSONDecoder().decode(Astronauts.self, from: jsonData)
    print(result.message)
    print(result.number)
    result.people.forEach {
      print($0)
    }
  } catch {
    print("Decodable Error")
  }
}

sample2()

struct Astronauts: Codable {
  var message: String
  var number: Int
  var people: [Person]
}

struct Person: Codable {
  var craft: String?
  var name: String
}


/*:
 ### 모델 만들어서 JSON 디코딩 하기
*/
print("\n--------------(문제 1)--------------\n")

func testDecoding() {
  let jsonDataSample = """
   {
   "statusCode": 200,
   "body": [
     {
       "id": 536,
       "price": "19650",
       "oily_score": 100,
       "thumbnail_image": "https://grepp-programmers-challenges.s3.ap-northeast-2.amazonaws.com/2020-birdview/thumbnail/ef792a79-435c-44eb-b9dc-285750ae1517.jpg",
       "title": "플라멜엠디 밀크러스트필 마일드 워시오프 앰플 5ml x 2개"
     },
     {
       "id": 258,
       "price": "25550",
       "oily_score": 100,
       "thumbnail_image": "https://grepp-programmers-challenges.s3.ap-northeast-2.amazonaws.com/2020-birdview/thumbnail/2c7672aa-5112-4f28-bd43-79ee817d67bf.jpg",
       "title": "아티스트리 맨 젠틀 페이스 워시 115ml"
     },
     {
       "id": 192,
       "price": "34200",
       "oily_score": 100,
       "thumbnail_image": null,
       "title": "제주온 하이온 제주 바다 보배 콜라겐 펩타이드 크림 50ml"
     },
     {
       "id": 987,
       "price": "3940",
       "oily_score": 100,
       "thumbnail_image": "https://grepp-programmers-challenges.s3.ap-northeast-2.amazonaws.com/2020-birdview/thumbnail/b0244924-7842-485d-bfee-05c0002b3743.jpg",
       "title": "타소스 옴므 2종 세트"
     }
    ]
   }
  """.data(using: .utf8)!
  
  
}

testDecoding()






//-----------------------------------------------------------------------------------//
