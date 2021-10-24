/**
 * @param {string} word
 * @return {number}
 */
 export var longestBeautifulSubstring = function(word) {
    let max = 0
    let ptr = 0
    let p = ptr
    
    while(word.length > p){
        ptr = findStartPoint(word, p)
        p = ptr
        let isBeautifulYet = true
        while(word.length > p && isBeautifulYet && word.charAt(p) !== 'u'){
            p = moveUntilNotDuplicatedChar(word, p)
            isBeautifulYet = isBeautifulOrder(word.charAt(p), word.charAt(p+1))
            p += 1
        }
        if(isBeautifulYet && word.charAt(p) === 'u'){
            max = Math.max(max, ptr - p+1)
        }
    }

    return max
};

export function moveUntilNotDuplicatedChar(word, ptr){
    let p = ptr + 1
    const char = word.charAt(ptr)
    while(word.length > p && word.charAt(p) === char){
        p += 1
    }
    return p - 1
}

export function findStartPoint(word, ptr){
    let p = ptr
    while(word.length > p && word.charAt(p) !== 'a'){
        p += 1
    }
    return p
}

export function isBeautifulOrder(c1,c2){
    switch(c1){
        case 'a':
           return c2 === 'e' 
        case 'e':
            return c2 === 'i' 
        case 'i':
            return c2 === 'o' 
        case 'o':
            return c2 === 'u'
        case 'u':
            return true
        default:
            return false
    }
}