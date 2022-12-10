function setData(tagNames, colorName) {
    // tagNames : list of string
    // colorName : string
    chrome.storage.local.set(
      {
        "tagNames": tagNames,
        "colorName": colorName
      }
    );
}

function reloadPage() {
    window.alert("reset");
//    location.reload();

    // reset-css
//    var link = document.createElement('link');
//    link.href = "https://cdn.jsdelivr.net/npm/the-new-css-reset@1.7.3/css/reset.min.css";
//    link.rel = 'stylesheet';
//    link.type = 'text/css';
//    var h = d.getElementsByTagName('head')[0];
//    h.appendChild(link);

    // initial
    const tags = ["a", "p", "button"];
    for (var tag of tags) {
        // CSS色付け
        var elements = document.getElementsByTagName(tag);
        for (var element of elements) {
            element.style.background = "initial";
            element.style.animation = "initial";
        }
    }
}

function changeColor() {
//    window.alert("changeColor");
    const colors = {rainbow: "Magenta, yellow, Cyan, Magenta",
                    black: "dimgray, darkgray, gainsboro, darkgray, dimgray",
                    brown: "saddlebrown, burlywood, antiquewhite, burlywood, saddlebrown",
                    orange: "darkorange, lightsalmon, navajowhite, lightsalmon, darkorange",
                    yellow: "yellow, khaki, lightyellow, khaki, yellow",
                    green: "limegreen, lightgreen, honeydew, lightgreen, limegreen",
                    blue: "blue, royalblue, lightskyblue, blue",
                    purple: "darkviolet, slateblue, lavender, slateblue, darkviolet",
                    pink: "deeppink, hotpink, pink, hotpink, deeppink",
                    red: "red, lightcoral, mistyrose, lightcoral, red"
                };  // 色の選択肢
    const tags = ["a", "p", "button"];  // タグの選択肢になる
    chrome.storage.local.get(null, function(items) {
        // ストレージからデータ取得
        var tagNames = items.tagNames;      // tagNames : list of string
        var colorName = items.colorName;    // colorName : string

        var notTagNames = [];   // 選択肢のタグの中で、チェックが入っていないタグ
        for (var tagName of tags) {
            if (!(tagNames.includes(tagName))) {
                notTagNames.push(tagName);
            }
        }

        // CSS初期化
//        var link = document.createElement('link');
//        link.href = "https://cdn.jsdelivr.net/npm/destyle.css@4.0.0/destyle.min.css";
//        link.rel = 'stylesheet';
//        link.type = 'text/css';
//        var h = d.getElementsByTagName('head')[0];
//        h.appendChild(link);
//        for (var notTag of notTagNames) {
//            var pre_elements = document.getElementsByTagName(notTag);
////            console.log(pre_elements.length);
//            for (var element of elements) {
//                element.style.background = "initial";
//                element.style.animation = "initial";
//            }
//        }
        const color = colors[colorName];    // 実際に選んだ色
        for (var tag of tagNames) {
            // CSS色付け
            var elements = document.getElementsByTagName(tag);
            for (var element of elements) {
                element.style.background = "linear-gradient(to right," + color + ") 0 / 200%";
                element.style.animation = "5s rainbowAnimation linear infinite";
            }
        }
    });
}

setInterval(() => {
    changeColor();
}, 500);
