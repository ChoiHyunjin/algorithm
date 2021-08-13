/**
 * @param {number[]} persons
 * @param {number[]} times
 */
 var TopVotedCandidate = function(persons, times) {
    this.persons = persons
    this.times = times
    this.voteArray = new Array(times.length)
    const array = new Array(times.length).fill(0)
    let maxIndex = 0
    persons.forEach((person, index)=>{
        array[person] += 1
        if(array[maxIndex] <= array[person]){
            maxIndex = person
        }
        this.voteArray[index] = maxIndex
    })
};

/** 
 * @param {number} t
 * @return {number}
 */
TopVotedCandidate.prototype.q = function(t) {
    const index = getIndexFromTimes(this.times, t)
    return index < 0 ? this.voteArray[this.voteArray.length-1]:this.voteArray[index]
};

/** 
 * Your TopVotedCandidate object will be instantiated and called as such:
 * var obj = new TopVotedCandidate(persons, times)
 * var param_1 = obj.q(t)
 */


function getIndexFromTimes(times, time){
    const res = times.findIndex(t => t>time)
    return times[times.length-1] === time?times.length-1:res -1
}

export default TopVotedCandidate