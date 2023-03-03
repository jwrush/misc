#!/usr/bin/env node

var arguments = process.argv

//the first two arguments are the node process and then the file name
var numbers  = [Number(arguments[2]),
                Number(arguments[3])].sort()

//euclid's algorithm

var [small,big] = numbers.sort()
var last = 1

while (small != 0)
{
    last = small
    small = big % small
    big = last
}

console.log(`${last} ${numbers[0]/last}:${numbers[1]/last}` )

