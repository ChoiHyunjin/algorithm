/**
 * @param {number[]} nums
 * @return {number}
 */
 var waysToSplit = function(nums) {
    const calArr = [...nums]
    const mod = 1e9 + 7
    for(let i = 1 ; i< nums.length ; i += 1){
        calArr[i] += calArr[i-1]
    }
    const sum = calArr[calArr.length-1]
    let count = 0

    let first = calArr[0]
    for(let i = 0 ; first <= sum/3 ; i += 1){
        let second = 0
        for(let j = i+1 ; second <= (sum-first)/2 ; j += 1){
            second = calArr[j] - calArr[i]
            if(second >= first && second <= (sum-first)/2){
                count += 1
            }
        }

        first = calArr[i + 1]
    }
    return count % mod
};

export {waysToSplit}