// https://leetcode.com/problems/find-the-winner-of-the-circular-game/

type Person = {
    next: Person | undefined
    value: number
}

function findTheWinner(n: number, k: number): number {
    let start: Person = {
        next: undefined,
        value: 1
    }
    let curr: Person = start

    for (let i = 2; i <= n; i += 1) {
        const p = {
            next: start,
            value: i
        }
        curr.next = p
        curr = p
    }

    let prev = curr
    curr = start
    let count = 1
    while(curr.next && curr.next !== curr){
        if(count < k){
            count += 1
            prev = curr
            curr = curr.next
            continue
        }

        count = 1
        prev.next = curr.next
        curr = prev.next
    }

    return curr.value
};
