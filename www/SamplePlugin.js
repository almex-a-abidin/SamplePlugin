var exec = require('cordova/exec');

exports.coolMethod = function (arg0, success, error) {
    exec(success, error, 'SamplePlugin', 'coolMethod', [arg0]);
};


exports.beginScan = function (arg0, success, error) {
    exec(success, error, 'SamplePlugin', 'beginScan', [arg0]);
};
