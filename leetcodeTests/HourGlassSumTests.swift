// https://www.hackerrank.com/challenges/2d-array/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=arrays
import XCTest

class HourGlassSumTests: XCTestCase {
  
  func countSum(_ arr: [[Int]], x: Int, y: Int) -> Int {
    return arr[x-1][y-1] + arr[x-1][y] + arr[x-1][y+1] + arr[x][y] + arr[x+1][y-1] + arr[x+1][y] + arr[x+1][y+1]
  }
  
  func hourglassSum(arr: [[Int]]) -> Int {
    var maxSum = Int.min
    for i in 1...arr.count-2 {
      for j in 1...arr[0].count-2 {
        let sum = countSum(arr, x: i, y: j)
        maxSum = max(maxSum, sum)
      }
    }
    
    return maxSum
  }
  
  func testCountSum() {
    let twoDArray = [
      [-9, -9, -9, 1, 1, 1],
      [0, -9, 0, 4, 3, 2],
      [-9, -9, -9, 1, 2, 3],
      [0, 0, 8, 6, 6, 0],
      [0, 0, 0, -2, 0, 0],
      [0, 0, 1, 2, 4, 0],
    ]
    XCTAssertEqual(countSum(twoDArray, x: 1, y: 1), -63)
  }
  
  func testHourglassSum_example1() {
    let twoDArray = [
      [-9, -9, -9, 1, 1, 1],
      [0, -9, 0, 4, 3, 2],
      [-9, -9, -9, 1, 2, 3],
      [0, 0, 8, 6, 6, 0],
      [0, 0, 0, -2, 0, 0],
      [0, 0, 1, 2, 4, 0],
    ]
    XCTAssertEqual(hourglassSum(arr: twoDArray), 28)
  }
  
  func testHourglassSum_example2() {
    let twoDArray = [
      [1, 1, 1, 0, 0, 0],
      [0, 1, 0, 0, 0, 0],
      [1, 1, 1, 0, 0, 0],
      [0, 0, 2, 4, 4, 0],
      [0, 0, 0, 2, 0, 0],
      [0, 0, 1, 2, 4, 0]
    ]
    XCTAssertEqual(hourglassSum(arr: twoDArray), 19)
  }
  
  func testHourglassSum_example3() {
    let twoDArray = [
      [1, 1, 1, 0, 0, 0],
      [0, 1, 0, 0, 0, 0],
      [1, 1, 1, 0, 0, 0],
      [0, 9, 2, -4, -4, 0],
      [0, 0, 0, -2, 0, 0],
      [0, 0, -1, -2, -4, 0]
    ]
    XCTAssertEqual(hourglassSum(arr: twoDArray), 13)
  }
  
  
}
