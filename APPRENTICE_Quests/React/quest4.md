# props でデータのやり取りができる

猫の画像のコンポーネントを使用します。一行目に h1 で 「Cute Cat」、二行目に以下の猫の画像を 2 つ横並びで表示してください。猫の画像のコンポーネントは別ファイルに分割してあります。

[https://i.imgur.com/O3EIPHpb.jpg](https://i.imgur.com/O3EIPHpb.jpg)

## 1. props

猫の画像のサイズを `width` と `height` という props で指定できるようにしてください。

import "./App.css";
import CuteCat from "./CuteCat";

function App() {
return (

<div>
<CuteCat height={200} width={200} />
</div>
);
}

export default App;

import React from "react";

function CuteCat({ width, height }) {
return (

<div>
<h1>CuteCat</h1>
<img
        src="https://i.imgur.com/O3EIPHpb.jpg"
        alt=""
        width={width}
        height={height}
      />
<img
        src="https://i.imgur.com/O3EIPHpb.jpg"
        alt=""
        width={width}
        height={height}
      />
</div>
);
}

export default CuteCat;

## 2. デフォルト値

props が指定されていない場合は、デフォルトで `width` と `height` が `200px` になるようにしてください。

import React from "react";

function CuteCat({ width = 200, height = 200 }) {
return (

<div>
<h1>CuteCat</h1>
<img
        src="https://i.imgur.com/O3EIPHpb.jpg"
        alt=""
        width={width}
        height={height}
      />
<img
        src="https://i.imgur.com/O3EIPHpb.jpg"
        alt=""
        width={width}
        height={height}
      />
</div>
);
}

export default CuteCat;

## 3. コンポーネントのネスト

コンポーネントはネストすることができます。

猫の画像のコンポーネントを、以下のようにネストして表示してください。

```jsx
function Card({ children }) {
  return (
    <div className="card">
      {/* コードを完成させてください */}
    </div>
  );
}

export default function CatList() {
  return (
    <Card>
      <Cat
        {/* コードを完成させてください */}
      />
    </Card>
  );
}
```
