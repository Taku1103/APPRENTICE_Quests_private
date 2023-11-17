const books = [
    {
    book_name : "JavaScript入門",
    book_author : "山田太郎"
    },

    {
    book_name : "JavaScriptの絵本",
    book_author : "山田次郎"
    }

]

function printBooks (books) {
    books.forEach(book => {
        let bn = book.book_name
        let ba = book.book_author
        console.log(`『${bn}』${ba}`);
    })
}

printBooks(books)





let users = [
    {
      username: '山田',
      permissions: {
        canRead: true,
        canWrite: true,
        canDelete: false
      }
    },
    {
      username: '佐藤',
      permissions: {
        canRead: false,
        canWrite: true,
        canDelete: false
      }
    },
    // ユーザーを追加してください
  ];

function checkPermission(check_name, check_permission) {
    users.forEach(user => {
        if (user.username === check_name){
            ans = user.permissions[check_permission]
            console.log(ans)
        }
    });
}

checkPermission('山田', 'canWrite')



const obj = {
    method: function() {
      console.log('method');
    },
  }
  
  obj.method();


  const obj1 = {
    method1: () => {
      console.log('method1');
    },
  }
  
  obj1.method1();

  const obj2 = {
    method2() {
      console.log('method2');
    },
  }
  
  obj2.method2();
