//const tags = ["a", "p", "button"];  // ここがタグの選択肢になる
//var tagNames = tags[1];              // 実際に選んだタグ

function changeColor(tagNames, colorName) {
    // tagNames : list of string
    // colorName : string
    const colors = {rainbow: "Magenta, yellow, Cyan, Magenta", pink: "deeppink, hotpink, pink, hotpink, deeppink", blue: "blue, royalblue, lightskyblue, blue"}; // ここが色の選択肢
    const color = colors[colorName];   // 実際に選んだ色
    window.alert(tagNames);
    window.alert(color);
    setTimeout(function(){
        console.log(document);
        for (var tag of tagNames) {
                console.log(document.getElementsByTagName('p').length);
                var elements = document.getElementsByTagName(tag);
//                window.alert(elements.length);
                for (var element of elements) {
//                    window.alert("good");
                    element.style.background = "linear-gradient(to right," + color + ") 0 / 200%";
                    element.style.animation = "5s rainbowAnimation linear infinite";
                }
            }
    }, 100);
}

//changeColor(['a', "p"], "pink");
