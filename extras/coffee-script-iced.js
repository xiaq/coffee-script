/**
 * CoffeeScript Compiler v1.2.0r
 * http://coffeescript.org
 *
 * Copyright 2011, Jeremy Ashkenas
 * Released under the MIT License
 */
(function(a){var b=function(){function a(b){return a[b]}return a["./iced"]=new function(){var a=this;((function(){var b,c=[].slice;a.generator=b=function(a,b,d){var e,f,g,h,i,j;return b.transform=function(a){return a.icedTransform()},b["const"]=e={k:"__iced_k",k_noop:"__iced_k_noop",param:"__iced_p_",ns:"iced",Deferrals:"Deferrals",deferrals:"__iced_deferrals",fulfill:"_fulfill",b_while:"_break",t_while:"_while",c_while:"_continue",n_while:"_next",n_arg:"__iced_next_arg",defer_method:"defer",slot:"__slot",assign_fn:"assign_fn",autocb:"autocb",retslot:"ret",trace:"__iced_trace",passed_deferral:"__iced_passed_deferral",findDeferral:"findDeferral",lineno:"lineno",parent:"parent",filename:"filename",funcname:"funcname",catchExceptions:"catchExceptions",runtime_modes:["node","inline","window","none"]},a.makeDeferReturn=function(b,d,f,g,h){var i,j,k,l;k={};for(i in g)l=g[i],k[i]=l;return k[e.lineno]=d!=null?d[e.lineno]:void 0,j=function(){var e,g,i;return e=1<=arguments.length?c.call(arguments,0):[],d!=null&&(i=d.assign_fn)!=null&&i.apply(null,e),b?(g=b,h||(b=null),g._fulfill(f,k)):a._warn("overused deferral at "+a._trace_to_string(k))},j[e.trace]=k,j},a.__c=0,a.tickCounter=function(b){return a.__c++,a.__c%b===0?(a.__c=0,!0):!1},a.__active_trace=null,a._trace_to_string=function(a){var b;return b=a[e.funcname]||"<anonymous>",""+b+" ("+a[e.filename]+":"+(a[e.lineno]+1)+")"},a._warn=function(a){return typeof console!="undefined"&&console!==null?console.log("ICED warning: "+a):void 0},d.Deferrals=f=function(){function b(a,b){this.trace=b,this.continuation=a,this.count=1,this.ret=null}return b.name="Deferrals",b.prototype._call=function(b){var c;return this.continuation?(a.__active_trace=b,c=this.continuation,this.continuation=null,c(this.ret)):a._warn("Entered dead await at "+a._trace_to_string(b))},b.prototype._fulfill=function(b,c){var d=this;if(!(--this.count>0))return a.tickCounter(500)?typeof process!="undefined"&&process!==null?process.nextTick(function(){return d._call(c)}):setTimeout(function(){return d._call(c)},0):this._call(c)},b.prototype.defer=function(b){var c;return this.count++,c=this,a.makeDeferReturn(c,b,null,this.trace)},b}(),d.findDeferral=i=function(a){var b,c,d;for(c=0,d=a.length;c<d;c++){b=a[c];if(b!=null?b[e.trace]:void 0)return b}return null},d.Rendezvous=g=function(){function c(){this.completed=[],this.waiters=[],this.defer_id=0,this[e.deferrals]=this}var b;return c.name="Rendezvous",b=function(){function a(a,b,c){this.rv=a,this.id=b,this.multi=c}return a.name="RvId",a.prototype.defer=function(a){return this.rv._deferWithId(this.id,a,this.multi)},a}(),c.prototype.wait=function(a){var b;return this.completed.length?(b=this.completed.shift(),a(b)):this.waiters.push(a)},c.prototype.defer=function(a){var b;return b=this.defer_id++,this.deferWithId(b,a)},c.prototype.id=function(a,c){var d;return c==null&&(c=!1),d={},d[e.deferrals]=new b(this,a,c),d},c.prototype._fulfill=function(a,b){var c;return this.waiters.length?(c=this.waiters.shift(),c(a)):this.completed.push(a)},c.prototype._deferWithId=function(b,c,d){return this.count++,a.makeDeferReturn(this,c,b,{},d)},c}(),d.stackWalk=j=function(b){var c,d,f,g;d=[],f=b?b[e.trace]:a.__active_trace;while(f)c="   at "+a._trace_to_string(f),d.push(c),f=f!=null?(g=f[e.parent])!=null?g[e.trace]:void 0:void 0;return d},d.exceptionHandler=h=function(a){var b;console.log(a.stack),b=j();if(b.length)return console.log("Iced 'stack' trace (w/ real line numbers):"),console.log(b.join("\n"))},d.catchExceptions=function(){return typeof process!="undefined"&&process!==null?process.on("uncaughtException",function(a){return h(a),process.exit(1)}):void 0}},a.runtime={},b(this,a,a.runtime)})).call(this)},a["./iced"]}();typeof define=="function"&&define.amd?define(function(){return b.runtime}):a.iced=b.runtime})(this)