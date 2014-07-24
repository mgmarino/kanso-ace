var attachments = require('kanso-utils/attachments'),
    async = require('async');

module.exports = {
  run : function(root, path, settings, doc, callback) {
    var ace = settings.ace;
    if (!ace) return callback(err, doc); 
    var int_settings = [ 
     "ext",
     "mode",
     "theme",
     "worker"
    ];
    var ddname = __dirname + "/../";
    int_settings.forEach( function(k) {
        var val = ace[k] || [];
        if (!Array.isArray(val)) {
          val = [val];
        } 
        val = val.map(function(o) { 
          return "ace/" + k + "-" + o + ".js"; 
        });
        async.forEachLimit(val, 20, function(p, cb) {
            attachments.addPath(ddname, p, doc, cb);
        },
        function(err) {
            callback(err, doc);
        });
    });
  }
}
