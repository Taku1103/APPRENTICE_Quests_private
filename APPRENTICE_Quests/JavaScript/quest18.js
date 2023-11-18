function checkDivisibleByFive (num) {
    try {
        if (num % 5 === 0){
            console.log(num / 5);
        }
        else{
            throw new Error("数値は5で割り切れません");
        }
    }
    catch(error){
        console.log(error.message)
    }
}

checkDivisibleByFive(100)
checkDivisibleByFive(12)

