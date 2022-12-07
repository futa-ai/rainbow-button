const tags = ["a", "p", "button"];  // ここが選択肢になる
var tagName = [tags[0], tags[1]];              // 実際に選んだタグ

for (var tag of tagName) {
    var elements = document.getElementsByTagName(tag);
    for (var element of elements) {
        element.style.background = "linear-gradient(to right, Magenta, yellow, Cyan, Magenta) 0 / 200%";
        element.style.animation = "5s example4 linear infinite";
    }
}
