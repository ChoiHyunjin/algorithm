/**
 * @param {string} tiles
 * @return {number}
 */
 var numTilePossibilities = function(tiles) {
    const chars = tiles.split('')

    const sets = new Array(tiles.length).fill(new Set())
    chars.forEach(c=>sets[0].add(c))

    const set = new Set()
    for(let i =1 ; i<tiles.length ; i+=1){
        sets[i] = getPermutation(chars, i+1, 0)
    }

    return sets.reduce((prev,curr)=>prev+curr.size,0)
}

function getPermutation(chars, length, ptr){
    if(length === 1) return chars.filter((item,i)=>ptr !== i)

    let res = new Set()
    for(let i = ptr ; i<chars.length-length + 1; i++){
        const combinedArray = getPermutation(chars.filter((item,idx)=>ptr !== idx), length-1, i+1)
        Array.from(combinedArray).forEach(word=>{
            combine(word, chars[i]).forEach(i => res.add(i))
            })
    }    
    return res
}

function combine(c1, c2){
    return [c1+c2, c2+c1]
}

export {numTilePossibilities, getPermutation, combine}