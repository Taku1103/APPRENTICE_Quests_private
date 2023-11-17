const h1 = document.getElementById('h1')
h1.textContent = "シンプルブログ"
console.log(h1.textContent);

const postForm = document.getElementById("post-form");
postForm.addEventListener("submit", function(event) {
    event.preventDefault();

    const title = document.getElementById("title");
    const content = document.getElementById("content");
    const titleValue = title.value
    const contentValue = content.value
    console.log("タイトル:", titleValue)
    console.log("内容:", contentValue)

})