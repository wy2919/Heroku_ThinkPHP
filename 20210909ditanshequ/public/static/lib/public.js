/*全局变量  公共方法*/
var domain = '';
var pageSize = 6; //每页显示条数
var page = 1; //当前页
var dataTotal = 0;//总页数

/*分页条数*/


/*
 * JavaScript MD5 1.0.1
 * https://github.com/blueimp/JavaScript-MD5
 *
 * Copyright 2011, Sebastian Tschan
 * https://blueimp.net
 *
 * Licensed under the MIT license:
 * http://www.opensource.org/licenses/MIT
 *
 * Based on
 * A JavaScript implementation of the RSA Data Security, Inc. MD5 Message
 * Digest Algorithm, as defined in RFC 1321.
 * Version 2.2 Copyright (C) Paul Johnston 1999 - 2009
 * Other contributors: Greg Holt, Andrew Kepert, Ydnar, Lostinet
 * Distributed under the BSD License
 * See http://pajhome.org.uk/crypt/md5 for more info.
 */

/*jslint bitwise: true */
/*global unescape, define */

(function ($) {
    'use strict';

    /*
    * Add integers, wrapping at 2^32. This uses 16-bit operations internally
    * to work around bugs in some JS interpreters.
    */
    function safe_add(x, y) {
        var lsw = (x & 0xFFFF) + (y & 0xFFFF),
            msw = (x >> 16) + (y >> 16) + (lsw >> 16);
        return (msw << 16) | (lsw & 0xFFFF);
    }

    /*
    * Bitwise rotate a 32-bit number to the left.
    */
    function bit_rol(num, cnt) {
        return (num << cnt) | (num >>> (32 - cnt));
    }

    /*
    * These functions implement the four basic operations the algorithm uses.
    */
    function md5_cmn(q, a, b, x, s, t) {
        return safe_add(bit_rol(safe_add(safe_add(a, q), safe_add(x, t)), s), b);
    }

    function md5_ff(a, b, c, d, x, s, t) {
        return md5_cmn((b & c) | ((~b) & d), a, b, x, s, t);
    }

    function md5_gg(a, b, c, d, x, s, t) {
        return md5_cmn((b & d) | (c & (~d)), a, b, x, s, t);
    }

    function md5_hh(a, b, c, d, x, s, t) {
        return md5_cmn(b ^ c ^ d, a, b, x, s, t);
    }

    function md5_ii(a, b, c, d, x, s, t) {
        return md5_cmn(c ^ (b | (~d)), a, b, x, s, t);
    }

    /*
    * Calculate the MD5 of an array of little-endian words, and a bit length.
    */
    function binl_md5(x, len) {
        /* append padding */
        x[len >> 5] |= 0x80 << (len % 32);
        x[(((len + 64) >>> 9) << 4) + 14] = len;

        var i, olda, oldb, oldc, oldd,
            a = 1732584193,
            b = -271733879,
            c = -1732584194,
            d = 271733878;

        for (i = 0; i < x.length; i += 16) {
            olda = a;
            oldb = b;
            oldc = c;
            oldd = d;

            a = md5_ff(a, b, c, d, x[i], 7, -680876936);
            d = md5_ff(d, a, b, c, x[i + 1], 12, -389564586);
            c = md5_ff(c, d, a, b, x[i + 2], 17, 606105819);
            b = md5_ff(b, c, d, a, x[i + 3], 22, -1044525330);
            a = md5_ff(a, b, c, d, x[i + 4], 7, -176418897);
            d = md5_ff(d, a, b, c, x[i + 5], 12, 1200080426);
            c = md5_ff(c, d, a, b, x[i + 6], 17, -1473231341);
            b = md5_ff(b, c, d, a, x[i + 7], 22, -45705983);
            a = md5_ff(a, b, c, d, x[i + 8], 7, 1770035416);
            d = md5_ff(d, a, b, c, x[i + 9], 12, -1958414417);
            c = md5_ff(c, d, a, b, x[i + 10], 17, -42063);
            b = md5_ff(b, c, d, a, x[i + 11], 22, -1990404162);
            a = md5_ff(a, b, c, d, x[i + 12], 7, 1804603682);
            d = md5_ff(d, a, b, c, x[i + 13], 12, -40341101);
            c = md5_ff(c, d, a, b, x[i + 14], 17, -1502002290);
            b = md5_ff(b, c, d, a, x[i + 15], 22, 1236535329);

            a = md5_gg(a, b, c, d, x[i + 1], 5, -165796510);
            d = md5_gg(d, a, b, c, x[i + 6], 9, -1069501632);
            c = md5_gg(c, d, a, b, x[i + 11], 14, 643717713);
            b = md5_gg(b, c, d, a, x[i], 20, -373897302);
            a = md5_gg(a, b, c, d, x[i + 5], 5, -701558691);
            d = md5_gg(d, a, b, c, x[i + 10], 9, 38016083);
            c = md5_gg(c, d, a, b, x[i + 15], 14, -660478335);
            b = md5_gg(b, c, d, a, x[i + 4], 20, -405537848);
            a = md5_gg(a, b, c, d, x[i + 9], 5, 568446438);
            d = md5_gg(d, a, b, c, x[i + 14], 9, -1019803690);
            c = md5_gg(c, d, a, b, x[i + 3], 14, -187363961);
            b = md5_gg(b, c, d, a, x[i + 8], 20, 1163531501);
            a = md5_gg(a, b, c, d, x[i + 13], 5, -1444681467);
            d = md5_gg(d, a, b, c, x[i + 2], 9, -51403784);
            c = md5_gg(c, d, a, b, x[i + 7], 14, 1735328473);
            b = md5_gg(b, c, d, a, x[i + 12], 20, -1926607734);

            a = md5_hh(a, b, c, d, x[i + 5], 4, -378558);
            d = md5_hh(d, a, b, c, x[i + 8], 11, -2022574463);
            c = md5_hh(c, d, a, b, x[i + 11], 16, 1839030562);
            b = md5_hh(b, c, d, a, x[i + 14], 23, -35309556);
            a = md5_hh(a, b, c, d, x[i + 1], 4, -1530992060);
            d = md5_hh(d, a, b, c, x[i + 4], 11, 1272893353);
            c = md5_hh(c, d, a, b, x[i + 7], 16, -155497632);
            b = md5_hh(b, c, d, a, x[i + 10], 23, -1094730640);
            a = md5_hh(a, b, c, d, x[i + 13], 4, 681279174);
            d = md5_hh(d, a, b, c, x[i], 11, -358537222);
            c = md5_hh(c, d, a, b, x[i + 3], 16, -722521979);
            b = md5_hh(b, c, d, a, x[i + 6], 23, 76029189);
            a = md5_hh(a, b, c, d, x[i + 9], 4, -640364487);
            d = md5_hh(d, a, b, c, x[i + 12], 11, -421815835);
            c = md5_hh(c, d, a, b, x[i + 15], 16, 530742520);
            b = md5_hh(b, c, d, a, x[i + 2], 23, -995338651);

            a = md5_ii(a, b, c, d, x[i], 6, -198630844);
            d = md5_ii(d, a, b, c, x[i + 7], 10, 1126891415);
            c = md5_ii(c, d, a, b, x[i + 14], 15, -1416354905);
            b = md5_ii(b, c, d, a, x[i + 5], 21, -57434055);
            a = md5_ii(a, b, c, d, x[i + 12], 6, 1700485571);
            d = md5_ii(d, a, b, c, x[i + 3], 10, -1894986606);
            c = md5_ii(c, d, a, b, x[i + 10], 15, -1051523);
            b = md5_ii(b, c, d, a, x[i + 1], 21, -2054922799);
            a = md5_ii(a, b, c, d, x[i + 8], 6, 1873313359);
            d = md5_ii(d, a, b, c, x[i + 15], 10, -30611744);
            c = md5_ii(c, d, a, b, x[i + 6], 15, -1560198380);
            b = md5_ii(b, c, d, a, x[i + 13], 21, 1309151649);
            a = md5_ii(a, b, c, d, x[i + 4], 6, -145523070);
            d = md5_ii(d, a, b, c, x[i + 11], 10, -1120210379);
            c = md5_ii(c, d, a, b, x[i + 2], 15, 718787259);
            b = md5_ii(b, c, d, a, x[i + 9], 21, -343485551);

            a = safe_add(a, olda);
            b = safe_add(b, oldb);
            c = safe_add(c, oldc);
            d = safe_add(d, oldd);
        }
        return [a, b, c, d];
    }

    /*
    * Convert an array of little-endian words to a string
    */
    function binl2rstr(input) {
        var i,
            output = '';
        for (i = 0; i < input.length * 32; i += 8) {
            output += String.fromCharCode((input[i >> 5] >>> (i % 32)) & 0xFF);
        }
        return output;
    }

    /*
    * Convert a raw string to an array of little-endian words
    * Characters >255 have their high-byte silently ignored.
    */
    function rstr2binl(input) {
        var i,
            output = [];
        output[(input.length >> 2) - 1] = undefined;
        for (i = 0; i < output.length; i += 1) {
            output[i] = 0;
        }
        for (i = 0; i < input.length * 8; i += 8) {
            output[i >> 5] |= (input.charCodeAt(i / 8) & 0xFF) << (i % 32);
        }
        return output;
    }

    /*
    * Calculate the MD5 of a raw string
    */
    function rstr_md5(s) {
        return binl2rstr(binl_md5(rstr2binl(s), s.length * 8));
    }

    /*
    * Calculate the HMAC-MD5, of a key and some data (raw strings)
    */
    function rstr_hmac_md5(key, data) {
        var i,
            bkey = rstr2binl(key),
            ipad = [],
            opad = [],
            hash;
        ipad[15] = opad[15] = undefined;
        if (bkey.length > 16) {
            bkey = binl_md5(bkey, key.length * 8);
        }
        for (i = 0; i < 16; i += 1) {
            ipad[i] = bkey[i] ^ 0x36363636;
            opad[i] = bkey[i] ^ 0x5C5C5C5C;
        }
        hash = binl_md5(ipad.concat(rstr2binl(data)), 512 + data.length * 8);
        return binl2rstr(binl_md5(opad.concat(hash), 512 + 128));
    }

    /*
    * Convert a raw string to a hex string
    */
    function rstr2hex(input) {
        var hex_tab = '0123456789abcdef',
            output = '',
            x,
            i;
        for (i = 0; i < input.length; i += 1) {
            x = input.charCodeAt(i);
            output += hex_tab.charAt((x >>> 4) & 0x0F) +
                hex_tab.charAt(x & 0x0F);
        }
        return output;
    }

    /*
    * Encode a string as utf-8
    */
    function str2rstr_utf8(input) {
        return unescape(encodeURIComponent(input));
    }

    /*
    * Take string arguments and return either raw or hex encoded strings
    */
    function raw_md5(s) {
        return rstr_md5(str2rstr_utf8(s));
    }

    function hex_md5(s) {
        return rstr2hex(raw_md5(s));
    }

    function raw_hmac_md5(k, d) {
        return rstr_hmac_md5(str2rstr_utf8(k), str2rstr_utf8(d));
    }

    function hex_hmac_md5(k, d) {
        return rstr2hex(raw_hmac_md5(k, d));
    }

    function md5(string, key, raw) {
        if (!key) {
            if (!raw) {
                return hex_md5(string);
            }
            return raw_md5(string);
        }
        if (!raw) {
            return hex_hmac_md5(key, string);
        }
        return raw_hmac_md5(key, string);
    }

    if (typeof define === 'function' && define.amd) {
        define(function () {
            return md5;
        });
    } else {
        $.md5 = md5;
    }
}(this));


function ismobile(){
    if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
        window.location = "/mobile"; //可以换成http地址
    }
}




//设置cookie
function setCookie(name, value) {
    if (!name || !value) return;
    var Days = 30;//默认30天
    var exp = new Date();
    exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
    document.cookie = name + "=" + encodeURIComponent(value) + ";expires=" + exp.toUTCString() + ";path=/";
}

//获取cookie
function getCookie(name) {
    var arr = document.cookie.match(new RegExp("(^| )" + name + "=([^;]*)(;|$)"));
    if (arr != null) return decodeURIComponent(arr[2]);
    return '';
}

//删除cookie
function delCookie(name) {
    var exp = new Date();
    exp.setTime(exp.getTime() - 1);
    var cval = getCookie(name);
    if (cval) document.cookie = name + "=;expires=" + exp.toUTCString() + ";path=/";
}

/*获取参数*/
function getParams(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return decodeURI(r[2]);
    return '';
}

/*获取文件名*/
function getFileName() {
    var path = location.href.split('?')[0];
    var pathArr = path.split('/')
    return pathArr[pathArr.length - 1];
}


// 注:时间戳转时间（ios手机NaN）
function getTime(ns) {
    if (!ns) return '';
    var date = new Date(parseInt(ns) * 1000);
    var year = date.getFullYear();
    var mon = +(date.getMonth() + 1)>10?(date.getMonth() + 1):'0'+(date.getMonth() + 1);
    var day = +date.getDate()>10?date.getDate():'0'+date.getDate();
    return year + '-' + mon + '-' + day;
}
function getTime1(ns) {
    if (!ns) return '';
    var date = new Date(parseInt(ns));
    var year = date.getFullYear();
    var mon = date.getMonth() + 1;
    var day = date.getDate();
    var hours = date.getHours();
    var minu = date.getMinutes();
    var sec = date.getSeconds();
    return year+'-'+mon+'-'+day+' '+hours+':'+minu+':'+sec;
    // return year + '-' + mon + '-' + day;
}
// function getTime2(ns){
//     if (!ns) return '';
//     var date = parseInt(ns);
//     var now= new Date().getTime()*1000;
//     var date1= date-now;
//     if(date1<=1000){
//         return date1;
//     }
//     var minu = date1.getMinutes();
//     var sec = date1.getSeconds();
//     return minu+'分'+sec+'秒';
//     // return year + '-' + mon + '-' + day;
// }
/*获取当前时间*/
function getNowTime() {
    var date = new Date();
    var year = date.getFullYear();
    var mon = date.getMonth() + 1;
    var day = date.getDate();
    var hours = date.getHours();
    var minu = date.getMinutes();
    var sec = date.getSeconds();
    // return year+'-'+mon+'-'+day+' '+hours+':'+minu+':'+sec;
    return year + '-' + mon + '-' + day;
}
/*获取当前时间*/
function getNowTime1() {
    var date = new Date();
    var year = date.getFullYear();
    var mon = date.getMonth() + 1;
    var day = date.getDate();
    var hours = date.getHours();
    var minu = date.getMinutes();
    var sec = date.getSeconds();
    return year+'-'+mon+'-'+day+' '+hours+':'+minu+':'+sec;
}

function isIdNo(card) {
    // 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X
    var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
    if(!reg.test(card)) {
        alert("身份证输入不合法");
        return  false;
    }
    return true;
}

// 验证中文名称
function isChinaName(name) {
    var pattern = /^[\u4E00-\u9FA5]{1,6}$/;
    return pattern.test(name);
}

// 验证手机号
function isPhoneNo(phone) {
    var pattern = /^1[34578]\d{9}$/;
    return pattern.test(phone);
}

// 验证身份证
function isCardNo(card) {
    var pattern = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
    return pattern.test(card);
}

// 验证URL
function isURL(url) {
    var pattern = /^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\*\+,;=.]+$/;
    return pattern.test(url);
}

// 验证时间
function isDate(dd) {
    var pattern = /^(\d{4})-(\d{2})-(\d{2})$/;
    return pattern.test(dd);
}

/*验证邮箱*/
function isemail(email) {
    var myreg = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
    if (!myreg.test(email)) {
        //layer.msg('请输入正确邮箱地址');
        return false;
    } else {
        return true;
    }
}


// 验证座机
function isZuojiNo(phone) {
    var pattern = /^0?1[35]\d{9}$/;
    var pattern1 = /^(\d{2,4}[-_－—]?)?\d{3,8}([-_－—]?\d{3,8})?([-_－—]?\d{1,7})?$/;
    return (pattern.test(phone) || pattern1.test(phone));
}

//验证护照号码
function checkPassport(code) {
    var pattern = /^((1[45]\d{7})|(G\d{8})|(P\d{7})|(S\d{7,8}))?$/;
    return pattern.test(code);
}

//港澳通行证
function checkGAT(code) {//var re = /^[HMhm]{1}([0-9]{10}|[0-9]{8})$/;
    var pattern = /^[HMhm]{1}([0-9]{10}|[0-9]{8})$/;
    return pattern.test(code);
}

/*文件大小转换*/
function sizeTostr(size) {
    var data = "";
    if (size < 0.1 * 1024) { //如果小于0.1KB转化成B
        data = size.toFixed(2) + "B";
    } else if (size < 0.1 * 1024 * 1024) {//如果小于0.1MB转化成KB
        data = (size / 1024).toFixed(2) + "KB";
    } else if (size < 0.1 * 1024 * 1024 * 1024) { //如果小于0.1GB转化成MB
        data = (size / (1024 * 1024)).toFixed(2) + "MB";
    } else { //其他转化成GB
        data = (size / (1024 * 1024 * 1024)).toFixed(2) + "GB";
    }
    var sizestr = data + "";
    var len = sizestr.indexOf("\.");
    var dec = sizestr.substr(len + 1, 2);
    if (dec == "00") {//当小数点后为00时 去掉小数部分
        return sizestr.substring(0, len) + sizestr.substr(len + 3, 2);
    }
    return sizestr;
}

/*隐藏手机号中间四位*/
function encryp_phone(phone) {
    var tel = ''+phone;
    console.log(phone.length);
    console.log(phone.length);
    if (phone.length == 11) {
        tel = phone.substr(0, 3) + '****' + phone.substr(7);
    }
    return tel;
}

function getContentType1(v) {
    var contentType1 = { '1':'罚款单', '2':'设计变更', '3':'工程问题上报'};
    return contentType1[v];
}


function url_get(url, params, success) {
    // 'Content-Type':'application/json;charset=utf8',
    $.ajax({
        type: "get",
        url: domain + url,
        data: params,
        dataType: 'json',
        success: function (data) {
            // success(data);
            // 0代表失败 1代表成功
            if (data.code == 1) {
                success(data);
            } else {
                layer.msg(data.message,{  icon:2,time:2000});
            }
        },
        error: function (error) {
            console.log('网络出错:' + url);
        }
    });
}

function url_post(url, params, success) {
    $.ajax({
        type: "post",
        url: domain + url,
        data: params,
        dataType: 'json',
        success: function (data) {
            if (data.code == 1) {
                success(data);
            } else {
                layer.msg(data.message,{  icon:2,time:2000});
            }
        },
        error: function (error) {
            console.log(error);
            console.log('网络出错:' + url);
        }
    });
}

function url_post_file(url, params, success) {
    $.ajax({
        type: "post",
        url: imgpath + url,
        data: params,
        xhrFields: {
            withCredentials: true
        },
        headers: {
            'jtoken': getJtoken(url, params),
            'jwtToken': getCookie('jwtToken') ? getCookie('jwtToken') : ''
        },
        dataType: 'json',
        processData: false,
        contentType: false,
        success: function (data) {
            success(data);
            if (data.success) {
                success(data);
            } else {
                stateCode(data)
            }
        },
        error: function (error) {
            console.log('网络出错:' + url);
        }
    });
}


/**
 ** 分页函数
 ** 参数：page=页数,totalPage=总页数
 ** 返回值：html字符串
 **/
function LoadPage(page, totalPage, pagesize = 10, getdata) {
    var htmlPage = '<div class="layui-box layui-laypage layui-laypage-default" id="layui-laypage-1">';
    //上一页
    if (page == 1) {
        htmlPage += '<a class="pagea">上一页</a>';
    } else {
        htmlPage += '<a class="pagea" onclick="onPage(' + (parseInt(page) - 1) + ')">上一页</a>';
    }
    //首页
    if (page > 5) {
        // htmlPage += '<a onclick="onPage(1)">1</a>';
    }
    //页数
    var start = page > 4 ? page - 4 : 1;
    var end = (totalPage - start) > 4 ? start + 5 : totalPage;
    for (var i = start; i <= end; i++) {
        if (i == page) {
            htmlPage += '<a class="active" onclick="onPage(' + i + ')" data-page="' + i + '">' + i + '</a>';
        } else {
            htmlPage += '<a onclick="onPage(' + i + ')" data-page="' + i + '">' + i + '</a>';
        }
    }


    if ((totalPage - end) > 2) {
        htmlPage += '<a>...</a>';
        htmlPage += '<a onclick="onPage(' + (totalPage - 1) + ')">' + (totalPage - 1) + '</a>';
        htmlPage += '<a onclick="onPage(' + totalPage + ')">' + totalPage + '</a>';
    }


    //下一页
    if (page == totalPage) {
        htmlPage += '<a class="pagea">下一页</a>';
    } else {
        htmlPage += '<a class="pagea" onclick="onPage(' + (parseInt(page) + 1) + ')">下一页</a>'
    }

    htmlPage += '\t<div class="fl pgb">\n' +
        '\t\t\t\t\t\t\t\t\t<span class="marl10 fl">到</span>\n' +
        '\t\t\t\t\t\t\t\t\t<input class="fl" type="text" name="" id="page_num" value="">\n' +
        '\t\t\t\t\t\t\t\t\t<span class="fl">页</span>\n' +
        '\t\t\t\t\t\t\t\t\t<a class="pagea1" onclick="onPage($(\'#page_num\').val())">确定</a>\n' +
        '\t\t\t\t\t\t\t\t</div>';

    return htmlPage;
}








