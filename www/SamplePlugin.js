var exec = require('cordova/exec');

function SamplePlugin() {};

SamplePlugin.prototype.coolMethod = function (arg0, success, error) {
    exec(success, error, 'SamplePlugin', 'coolMethod', [arg0]);
};

SamplePlugin.prototype.beginScan = function () {
    exec(null, null, 'SamplePlugin', 'beginScan', []);
};

if(!window.plugins)
    window.plugins = {};

if (!window.plugins.NfcSessionAtOBJC)
    window.plugins.SamplePlugin = new SamplePlugin();

if (typeof module != 'undefined' && module.exports)
    module.exports = SamplePlugin;