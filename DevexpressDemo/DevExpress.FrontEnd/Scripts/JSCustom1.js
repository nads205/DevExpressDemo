var myTimer;
function OnButtonClick(s, e, startUrl, progressUrl) {
    StartActionOnServer(startUrl);
    StartTimer(progressUrl);
}
var fileNameInStorage;

function OnFileUploadComplete(s, e) {
    if (e.callbackData !== "") {
        fileNameInStorage = e.callbackData;
    }
    else {
        alert("The selected file was not uploaded.");
    }
}

function StartActionOnServer(startUrl) {
    var progress = {
        Overwrite: $("#Overwrite1").is(':checked'),
        Email: $("#Email").html(),
        fileNameInStorage: fileNameInStorage
    };

    $.ajax({
        type: 'POST',
        url: startUrl,
        data: JSON.stringify(progress),
        contentType: "application/json; charset=utf-8",
        dataType: 'json'
    }).done(ProgressCallbackComplete).fail(CallbackError);
}
function ProgressCallbackComplete(data) {
    StopTimer();
    alert('Accomplished');
}
function StartTimer(progressUrl) {
    window.btnStart.SetEnabled(false);
    window.myProgressBar.SetVisible(true);
    myTimer = setInterval(function () {
        $.ajax({
            type: 'POST',
            url: progressUrl,
            dataType: 'json'
        }).done(TimerCallbackComplete).fail(CallbackError);
    }, 500);
}
function StopTimer() {
    window.myProgressBar.SetVisible(false);
    window.myProgressBar.SetPosition(0);
    window.btnStart.SetEnabled(true);
    if (myTimer) {
        clearInterval(myTimer);
        myTimer = null;
    }
}
function TimerCallbackComplete(data) {
    window.myProgressBar.SetPosition(parseInt(data.ProgressResult));
    //window.myLabel.SetText(data.ProgressResult);
}
function CallbackError() {
    StopTimer();
    alert('Callback error');
}