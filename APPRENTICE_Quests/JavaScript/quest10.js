function hasOdd(num_arr) {
    let flag = false;
    num_arr.forEach(num => {
        if (num % 2 === 0){flag = true}
    });
    console.log(flag);
}

const numbers = [1, 2, 3, 4, 5];

hasOdd(numbers);

// --------------------------------

const numbers_2 = [1, 3, 5]

function odd(num_arr) {
    let odd_arr = []
    num_arr.forEach(num =>{
        if (num % 2 != 0){
            odd_arr.push(num);
        }
    });
    return odd_arr;
}

console.log(odd(numbers_2));


// --------------------------------

const numbers_3 = [1, 2, 3, 4, 5]

function square(num_arr){
    let sqr_arr = []
    num_arr.forEach(num => {
        sqr_arr.push(num**2)
    });
    return sqr_arr
}

console.log(square(numbers_3));

