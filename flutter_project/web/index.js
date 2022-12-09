const tags = ["a", "p", "button"];  // ここがタグの選択肢になる
var tagName = tags[1];              // 実際に選んだタグ

const colors = {rainbow: "Magenta, yellow, Cyan, Magenta", pink: "deeppink, hotpink, pink, hotpink, deeppink", blue: "blue, royalblue, lightskyblue, blue"}; // ここが色の選択肢
const colorName = colors["blue"];   // 実際に選んだ色

var elements = document.getElementsByTagName(tagName);
for (var element of elements) {
    element.style.background = "linear-gradient(to right," + colorName + ") 0 / 200%";
    element.style.animation = "5s rainbowAnimation linear infinite";
}
