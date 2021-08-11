/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number[][]}
 */


 function hasSameValue(arr1, data){
    return arr1.some(ar1=>
        data.every((ar2,i)=>{
            return ar1[i] === ar2
        })
    )
}

var twoSum = function(nums, target, start, end) {
    const res = []
    for(let i=start; i<end; i++ ){
        if(target <= nums[i]+nums[end])
            for(let j=end; j>i ; j--){
                if(target === nums[i]+nums[j]) {
                    const data = [nums[i], nums[j]]
                    if(!hasSameValue(res,data)) res.push(data)
                }
                else if(target > nums[i]+nums[j]) j=i
            }
    }

    return res
};
export var fourSum = function(nums, target) {
    const arr = nums
    arr.sort((a,b) => a-b)
    const res = []
    for(let i=0 ; i<=nums.length-4; i++ ){
        for(let j=arr.length-1; j>=i+3 ; j--){
            const two = twoSum(nums, target-(arr[i]+arr[j]), i+1, j-1)
            two.forEach((t)=>{
                const data = [arr[i], ...t, arr[j]]
                if(!hasSameValue(res, data)) res.push(data)
            })
        
        }
    }

    return res
};

console.log(fourSum([0,0,0,0] ,0))
console.log(fourSum([2,2,2,2,2] ,8))
console.log(fourSum([1,0,-1,0,-2,2] ,0))