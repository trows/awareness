/**
 * Created by qingrun.cqr on 2015/8/11.
 */
/*!!cmd:commonjs=false*/
(function(win, lib) {
    var doc = win.document;
    var docEl = doc.documentElement;
    var tid;
    var flexible = lib.flexible || (lib.flexible = {});

    function refreshRem() {
        var width = docEl.clientWidth < 600 ? 600 : docEl.clientWidth;
        var height = docEl.clientHeight < 400 ? 400 : docEl.clientHeight;
        var ratio = width / height;
        var rem = width / 15;
        if (ratio > 1.5){
            rem = height / 10;
        }
        docEl.style.fontSize = rem + 'px';
        flexible.rem = win.rem = rem;
    }

    win.onresize = function() {
        clearTimeout(tid);
        tid = setTimeout(refreshRem, 300);
    };
    win.onpageshow = function(e) {
        if (e.persisted) {
            clearTimeout(tid);
            tid = setTimeout(refreshRem, 300);
        }
    }

    if (doc.readyState === 'complete') {
        doc.body.style.fontSize = 12 + 'px';
    } else if (doc.addEventListener){
        doc.addEventListener('DOMContentLoaded', function(e) {
            doc.body.style.fontSize = 12 + 'px';
        }, false);
    }
    refreshRem();
    flexible.refreshRem = refreshRem;
    flexible.rem2px = function(d) {
        var val = parseFloat(d) * this.rem;
        if (typeof d === 'string' && d.match(/rem$/)) {
            val += 'px';
        }
        return val;
    }
    flexible.px2rem = function(d) {
        var val = parseFloat(d) / this.rem;
        if (typeof d === 'string' && d.match(/px$/)) {
            val += 'rem';
        }
        return val;
    }

})(window, window['fui'] || (window['fui'] = {}));