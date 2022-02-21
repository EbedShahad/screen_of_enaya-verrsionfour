void imageSendToApi("282","s","t","u","1","2","1",file)
{
    var file = document.getElementById("file").files[0];
    var form = new FormData();
    form.append("file", file);
    var settings = {
       "url": "https://209.50.49.210/api/moveImage",
       "method": "POST",
       "timeout": 0,
       "headers": {
          "Accept": "application/json"
       },
       "processData": false,
       "mimeType": "multipart/form-data",
       "contentType": false,
       "data": form
    };
    //response from server
    $.ajax(settings).done(function (response) {
    });
}
