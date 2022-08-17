function getViewFileName(filepath) {
                var path = filepath.toString();
                var path_view = path.split('/').pop();
    return path_view;
}

function getModelFileName(filepath) {
                var path = filepath.toString();
                var path_model = path.replace("file:///","");
    return path_model;
}

function highlightCurrentSliderValue(option) {
    option1.color = "#CACACA"
    option2.color = "#CACACA"
    option3.color = "#CACACA"
    option4.color = "#CACACA"
    console.log(option)
    switch(option) {
    case 1:
        option1.color = Qt.lighter("#4bb543")
        break;
    case 2:
        option2.color = Qt.lighter("#4bb543")
        break;
    case 3:
        option3.color = Qt.lighter("#4bb543")
        break;
    case 4:
        option4.color = Qt.lighter("#4bb543")
        break;
    }
}
