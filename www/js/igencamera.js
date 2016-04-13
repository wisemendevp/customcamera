var igencamera = {
getPicture: function(success, failure){
    cordova.exec(success, failure, "igencamera", "openCamera", []);
}
};
module.exports = igencamera;
