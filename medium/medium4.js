/**
 * @param {number[]} nums1
 * @param {number[]} nums2
 * @return {number}
 */
 var findMedianSortedArrays = function(nums1, nums2) {
    let ptr1 = 0
    let ptr2 = 0

    const merge = []
    const mergeLength = nums1.length + nums2.length
    if(mergeLength===0) return 0
    else if(nums1.length === 0){
        return nums2.length %2 === 1 ?
        nums2[Math.floor(nums2.length/2)]
        :(nums2[nums2.length/2-1]+nums2[nums2.length/2])/2
    }else if(nums2.length === 0){
        return nums1.length %2 === 1 ?
        nums1[Math.floor(nums1.length/2)]
        :(nums1[nums1.length/2-1]+nums1[nums1.length/2])/2
    }

    const length = mergeLength%2 ===0 ? mergeLength/2-1 : mergeLength/2
    for(let i =0 ; i < mergeLength/2-1; i+=1){
        if(ptr1 === nums1.length){
            // merge[i] = nums1[ptr1]
            ptr2 +=1
        }else if(ptr2 === nums2.length){
            // merge[i] = nums2[ptr2]
            ptr1 +=1
        }else if(nums1[ptr1] < nums2[ptr2]){
            // merge[i] = nums1[ptr1]
            ptr1 +=1
        }else if(nums1[ptr1] > nums2[ptr2]){
            // merge[i] = nums2[ptr2]
            ptr2 +=1
        }else{
            if(ptr1 > ptr2) ptr2+=1
            else ptr1 += 1
        }
    }

    // if(ptr1 < nums1.length || ptr2 < nums2.length){
    //     let arr
    //     let ptr
    //     if(ptr1 === nums1.length){
    //         ptr = ptr2
    //         arr = nums2 
    //     }else{
    //         ptr = ptr1
    //         arr = nums1
    //     }
    //     for(let i = ptr; i<arr.length ; i+=1){
    //         merge[merge.length] = arr[i]
    //     }
    // }

    let res = 0

    // if(merge.length %2 === 0){
    //     res = (merge[merge.length/2] + merge[merge.length/2 - 1]) / 2
    // }else{
    //     res = merge[Math.floor(merge.length/2)]
    // }

    if(mergeLength %2 === 0){
        if(ptr1 === nums1.length){
            res = nums2[ptr2]
            ptr2 += 1
        }else if(ptr2 === nums2.length){
            res = nums1[ptr1]
            ptr1 += 1
        }else if(nums1[ptr1] <= nums2[ptr2]){
            res = nums1[ptr1]
            ptr1 += 1
        }else{
            res = nums2[ptr2]
            ptr2 += 1
        }
        res += nums1[ptr1] < nums2[ptr2] ? nums1[ptr1] : nums2[ptr2]
        res = res /2 
    }else{
        res = nums1[ptr1] < nums2[ptr2] ? nums1[ptr1] : nums2[ptr2]
    }
    return res
};
export default findMedianSortedArrays