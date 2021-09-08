/**
 * @param {number[]} source
 * @param {number[]} target
 * @param {number[][]} allowedSwaps
 * @return {number}
 */
 var minimumHammingDistance = function(source, target, allowedSwaps) {
    let min = Number.MAX_VALUE
    min = Math.min(min, getHammingDistance(source, target))

    allowedSwaps.forEach(indexes => {
        swap(source, indexes)
        min = Math.min(min, getHammingDistance(source, target))
    })

    return min
};

function swap(source, indexes){
    const temp = source[indexes[0]]
    source[indexes[0]] = source[indexes[1]]
    source[indexes[1]] = temp
}

function getHammingDistance(source, target){
    return source.reduce((p, c, i)=> c !== target[i] ? p+1 : p, 0)
}

export default minimumHammingDistance