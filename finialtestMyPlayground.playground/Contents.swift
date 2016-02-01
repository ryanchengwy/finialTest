func twoSum(numberArray: [Int], target: Int) -> (Int, Int) {
    for var i = 0; i < numberArray.count; i++ {
        for var j = i+1 ; j < numberArray.count; j++ {
            var sum = numberArray[i] + numberArray[j]
            if sum == target {
                return (i+1, j+1)
            }
        }
    }
    return (-1, -1)
}

twoSum([2,7,11,15], target: 18)
