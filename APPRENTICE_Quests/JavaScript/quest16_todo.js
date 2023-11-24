// todo 表示保存
// 削除
// todo完了

const form = document.getElementById('form')
const input = document.getElementById('todo-input')
const todoList = document.getElementById('todo-list')

const todos = JSON.parse(localStorage.getItem("todos"));

// ローカルストレージに保存されているものを反映
if (todos) {
    todos.forEach(todo => {
        add(todo);
    });
}

// submitされたらadd関数実行
form.addEventListener('submit', function(event){
    event.preventDefault();
    console.log(input.value);
    add()
})

function add(todo) {
    let todoText = input.value;

    //todoオブジェクトからtextを引っ張り出す
    if(todo) {
        todoText = todo.text;
    }

    // テキストがあったら li, 削除button, チェックボックスinputタグ追加
    if (todoText){
    const li = document.createElement('li');
    const deleteButton = document.createElement('button');
    const completedCheckbox = document.createElement('input');

    li.innerText = todoText

    li.classList.add('list-group-item');
    deleteButton.classList.add('delete-button');
    completedCheckbox.classList.add("completed-checkbox");
    completedCheckbox.type = "checkbox";

    // 完了情報をもってたら反映
    if (todo && todo.completed){
        li.classList.add("text-decoration-line-through");
        completedCheckbox.checked = true;
    }

    // 右クリックで削除機能追加
    deleteButton.addEventListener("click", function (event){
        event.preventDefault();
        li.remove();
        deleteButton.remove();
        completedCheckbox.remove();
        saveData();
    })

    // checkboxで打消し完了機能追加
    completedCheckbox.addEventListener('click', function () {
        li.classList.toggle("text-decoration-line-through");
        saveData()
    })

    // todoListに追加、消して保存
    todoList.appendChild(li);
    todoList.appendChild(deleteButton);
    todoList.appendChild(completedCheckbox);
    input.value = ''
    saveData()
}}

function saveData() {
    const lists = document.querySelectorAll("li")
    let todos = [];

    // todoオブジェクトにtextとcompletedの情報を格納
    lists.forEach(list => {
        let todo = {
            text : list.innerText,
            completed: list.classList.contains('text-decoration-line-through')
        }
        todos.push(todo);
    });
    localStorage.setItem("todos", JSON.stringify(todos));
}

