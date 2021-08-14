/**
 * @param {string} characters
 * @param {number} combinationLength
 */
 var CombinationIterator = function(characters, combinationLength) {
    this._length = combinationLength,
    this._chars = characters.split('')
    this.combinations = getCombinations(this._chars, this._length, 0)
};

/**
 * @return {string}
 */
CombinationIterator.prototype.next = function() {
    return this.combinations.shift()
};

/**
 * @return {boolean}
 */
CombinationIterator.prototype.hasNext = function() {
    return this.combinations.length > 0
};

/** 
 * Your CombinationIterator object will be instantiated and called as such:
 * var obj = new CombinationIterator(characters, combinationLength)
 * var param_1 = obj.next()
 * var param_2 = obj.hasNext()
 */

function getCombinations(chars, length, ptr){
    if(length === 1) return chars.slice(ptr)
    let res = []
    for(let i=ptr ; i < chars.length - length + 1 ; i += 1){
        const combinations = getCombinations(chars, length-1, i+1)
        res = [...res, ...combinations.map(c => chars[i]+c)]
    }
    return res
}

// export {getCombinations, CombinationIterator}