const h1 = document.getElementById('h1')
h1.textContent = "シンプルブログ"
console.log(h1.textContent);

const postForm = document.getElementById("post-form");
const posts = document.getElementById("posts");

postForm.addEventListener("submit", function(event) {
    event.preventDefault();

    const title = document.getElementById("title");
    const content = document.getElementById("content");
    const titleValue = title.value;
    const contentValue = content.value;

    appendPost(posts, titleValue, contentValue)

    title.value = ""
    content.value = ""

    if(posts.children.length >= 3){
        posts.removeChild(posts.firstElementChild)
    }
})

posts.addEventListener("mouseover", function(){
    posts.style.backgroundColor = "yellow";
});

posts.addEventListener("mouseout", function(){
    posts.style.backgroundColor = "white";
});


function appendPost(container, title, content){
    const post_div = document.createElement("div");
    const post_h2 = document.createElement("h2");
    const post_p = document.createElement("p");
    post_h2.innerText = title;
    post_p.innerText = content;

    container.appendChild(post_div);
    post_div.appendChild(post_h2);
    post_div.appendChild(post_p);
}