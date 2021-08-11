/**
 * @param {string} s
 * @return {number}
 */
 var lengthOfLongestSubstring = function(s) {
    let res = ''
    let max = 0

    for(let i=0 ; i<s.length ; i+=1){
        const ch = s.charAt(i)
        const index = res.indexOf(ch)
        
        if(index < 0){
            res += ch
        }else{
            max = max>res.length? max : res.length
            res = res.slice(index+1, res.length )
            res += ch
        }
    }
    return  max>res.length? max : res.length
};

console.log(lengthOfLongestSubstring('abcabcbb'))
console.log(lengthOfLongestSubstring('aab'))