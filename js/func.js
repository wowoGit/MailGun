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
