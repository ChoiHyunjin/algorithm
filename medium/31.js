
export function swap(arr, a, b){
    const temp = arr[a]
    arr[a] = arr[b]
    arr[b] = temp
}

/**
 * 
 * @param {number[]} arr 
 * @param {number} a 
 */
export function sort(arr, a){
    const temp = arr.slice(a)
    temp.sort()
    temp.forEach((value,i) => {
        arr[a+i] = value
    })
}

/**
 * @param {number[]} nums
 * @return {void} Do not return anything, modify nums in-place instead.
 */
 var nextPermutation = function(nums) {
    const res = []

    if(nums.length === 1) return nums

    // 1. 앞에서부터 오름차순 깨지는 곳 a 구하기
    let a = 0
    nums.every((num, i) => {
        if(i===0 || nums[i-1] <= num){
            a = i
            return true
        }
        return false
    })
    // for(; a<nums.length && nums[a-1] <= nums[a]; a+=1 ){    }
    console.log('a:', a )
    if(a === nums.length-1){
        console.log('swap1', a )
        // 최소값인 경우
        swap(nums, a, a-1)
        return nums
    }

    // 2. 뒤에서부터 a+1까지 오름차순 깨지는 곳 b 구하기
    let b =nums.length-1
    let min = b
    for(let i=b; i>=a; i-=1 ){  
        console.log('i:', i)
        if(i === 0 || nums[i] <= nums[i-1]){
            b= i
            min = nums[min] > nums[b] ? b : min
        }else{
            i = -1
        }
    }
    console.log('b:', b)
    // 3. a, b 교체
    if(a===b){
        // 3-1 a=b인 경우 
        if(a===0 && b=== 0){
            // 3-1-1 최대값인 경우
            console.log('max', a,b )
            return nums.sort()
        }else{
            console.log('swap2', a,min )
            swap(nums, a, min)
        }
    }else{
        console.log('swap2', a,b )
        swap(nums, a,b)
    }

    // 4. a+1 부터 오름차순 정렬
    sort(nums, a+1)
    return nums
};


// 1237485 -> a:4(5th), b:4(5th) -> a와 제일 작은 5 교체 후 a+1부터 오름차순 -> 1237548
// 1237854 -> a:5(6th), b:5(6th) -> a=b 이므로, 제일 작은 4와 a 교체 후 a+1부터 오름차순 -> 1243578
// 1237858 -> a:5(6th), b:8(7th) -> 5, 8 교체 후 7번째부터 오름차순 -> 1237885
// 1283754 -> a:3(4th), b:3(4th) -> a=b 이므로, 제일 작은 4와 a 교체 후 a+1부터 오름차순 -> 1284357

const arr = [1,2,3]
// swap(arr, 0, 2)
// console.log(arr)
// sort(arr, 0)
// console.log(arr)
console.log(nextPermutation(arr))
console.log(nextPermutation([3,2,1]))
console.log(nextPermutation([1,1,5]))
console.log(nextPermutation([1]))
console.log(nextPermutation([10]))
console.log(nextPermutation([1,3,2]))
console.log(nextPermutation([1,2,3,7,4,8,5]))
console.log(nextPermutation([1,2,3,7,8,5,4]))
console.log(nextPermutation([1,2,3,7,8,5,8]))
console.log(nextPermutation([1,2,8,3,7,5,4]))