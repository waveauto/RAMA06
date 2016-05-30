function fShowAlert(pTag) {
    $("#msg").html(pTag);
}
function fHideAlert() {
    $("#msg").html("");
}
function fShowModal(pModalName) {
    $(pModalName).modal('show');
}
function fHideModal(pModalName) {
    $(pModalName).modal('hide');
}