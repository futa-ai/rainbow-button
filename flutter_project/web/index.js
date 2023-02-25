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
    const tags = ["h1", "h2", "h3", "h4", "h5", "h6", "p", "a", "button", "ul", "ol", "img", "table", "tr", "th", "section", "article", "nav", "main", "footer"];
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

        for (var tag of notTagNames) {
            // CSS色付け
            var elements = document.getElementsByTagName(tag);
            for (var element of elements) {
                element.style.background = "initial";
            }
        }
    });
}

function changeColor() {
     const colorNames = ["rainbow", "black", "brown", "orange", "yellow", "green", "blue", "purple", "pink", "red"];
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
    const tags = ["h1", "h2", "h3", "h4", "h5", "h6", "p", "a", "button", "ul", "ol", "img", "table", "tr", "th", "section", "article", "nav", "main", "footer"];  // タグの選択肢になる
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

        const color = colorNames.includes(colorName) ? colors[colorName] : colorName;   // 選んだ色のカラーコードなど

        for (var tag of tagNames) {
            // CSS色付け
            var elements = document.getElementsByTagName(tag);
            for (var element of elements) {
                if (color.length == 9) {
                    element.style.background = color;
                } else {
                    element.style.background = "linear-gradient(to right," + color + ") 0 / 200%";
                    element.style.animation = "5s rainbowAnimation linear infinite";
                }
            }
        }
    });
}

setInterval(() => {
    reloadPage();
    changeColor();
}, 500);
