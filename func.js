function fnamefromFpath(filepath) {
                var path = fd.fileUrl.toString();
                var path_model = path.replace("file:///","");
                var path_view = path.split('/').pop();
    return path_view;
}
