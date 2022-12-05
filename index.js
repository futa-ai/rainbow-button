const tags = ["a", "p", "button"];  // ここが選択肢になる
var tagName = tags[0];              // 実際に選んだタグ

var elements = document.getElementsByTagName(tagName);
for (var element of elements) {
    element.style.background = "linear-gradient(to right, Magenta, yellow, Cyan, Magenta) 0 / 200%";
    element.style.animation = "5s example4 linear infinite";
}
