function checkTemperature(temp){
    if (temp >= 30){
        console.log("Hot");

    }else if (temp >= 15 && temp < 30){
        console.log("Warm");

    }else if (temp < 15){
        console.log("Cold");
    }
}

function checkOddOrEven(num) {
    if(num % 2 === 0){
        console.log("Even");
    }else{
        console.log("Odd");
    }
}

checkTemperature(30)
checkOddOrEven(2)

