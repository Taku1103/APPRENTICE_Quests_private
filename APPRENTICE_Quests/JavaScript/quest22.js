const weatherForm = document.getElementById("weatherForm")

fetch("https://api.openweathermap.org/data/2.5/weather?q={tokyo}&appid={ee78e5546ce1000248e46e2791d6a8f9}.openweathermap.org/data/2.5/weather?id=524901&appid=ee78e5546ce1000248e46e2791d6a8f9")
.then(response => {
    return response.json()
})
.then(data => {
    console.log(data)
})
.catch(error => {
    console.log(error)
})

weatherForm